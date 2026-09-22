#include "sim.h"

#include <math.h>
#include <string.h>

#define PI_F 3.14159265358979f
#define BIG_DIST 1.0e30f

static inline uint32_t rng_next(Sim *s) {
    uint32_t x = s->rng;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    return s->rng = x;
}

static inline float rng_range(Sim *s, float lo, float hi) {
    return lo + (hi - lo) * (float)(rng_next(s) >> 8) * (1.0f / 16777216.0f);
}

static inline float dist2(float ax, float ay, float bx, float by) {
    float dx = ax - bx, dy = ay - by;
    return dx * dx + dy * dy;
}


static float angle_diff(float target, float cur) {
    float d = target - cur;
    while (d > PI_F) d -= 2.0f * PI_F;
    while (d < -PI_F) d += 2.0f * PI_F;
    return d;
}

static inline void belief_clear(Belief *bl) {
    bl->valid = 0;
    bl->direct = 0;
    bl->rest = BIG_DIST;
    bl->age = 0.0f;
}


static float estimate(const Bee *b, const Belief *bl) {
    return sqrtf(dist2(b->x, b->y, bl->x, bl->y)) + bl->rest;
}

float resource_radius(const Resource *r) {
    float f = (float)r->hp * (1.0f / (float)RESOURCE_HP);
    return RESOURCE_RADIUS_MIN + (RESOURCE_RADIUS_MAX - RESOURCE_RADIUS_MIN) * sqrtf(f < 0.0f ? 0.0f : f);
}


static int32_t nearest_resource(const Sim *s, float x, float y, float reach) {
    float best = reach;
    int32_t bi = -1;
    for (int32_t i = 0; i < MAX_RESOURCES; ++i) {
        if (!s->resources[i].alive) continue;
        float d = sqrtf(dist2(x, y, s->resources[i].x, s->resources[i].y)) -
                  resource_radius(&s->resources[i]);
        if (d < best) {
            best = d;
            bi = i;
        }
    }
    return bi;
}

static void resource_spawn(Sim *s) {
    for (int32_t i = 0; i < MAX_RESOURCES; ++i) {
        if (s->resources[i].alive) continue;
        for (int32_t tries = 0; tries < 16; ++tries) {
            float x = rng_range(s, RESOURCE_RADIUS_MAX, WORLD_W - RESOURCE_RADIUS_MAX);
            float y = rng_range(s, RESOURCE_RADIUS_MAX, WORLD_H - RESOURCE_RADIUS_MAX);
            if (dist2(x, y, s->hive_x, s->hive_y) < RESOURCE_MIN_HIVE_DIST * RESOURCE_MIN_HIVE_DIST)
                continue;
            s->resources[i] = (Resource){x, y, RESOURCE_HP, 1};
            return;
        }
        return;
    }
}

void sim_init(Sim *s, uint32_t seed) {
    memset(s, 0, sizeof(*s));
    s->rng = seed ? seed : 0x9e3779b9u;
    s->hive_x = WORLD_W * 0.5f;
    s->hive_y = WORLD_H * 0.5f;
    s->bee_count = BEE_COUNT;
    for (int32_t i = 0; i < s->bee_count; ++i) {
        Bee *b = &s->bees[i];
        float a = rng_range(s, 0.0f, 2.0f * PI_F), r = rng_range(s, 0.0f, HIVE_SIZE);
        b->x = s->hive_x + cosf(a) * r;
        b->y = s->hive_y + sinf(a) * r;
        b->heading = rng_range(s, 0.0f, 2.0f * PI_F);
        b->scout = (i % SCOUT_EVERY) == 0;
        belief_clear(&b->belief[GOAL_RESOURCE]);
        belief_clear(&b->belief[GOAL_HIVE]);
    }
    for (int32_t i = 0; i < RESOURCE_START_COUNT; ++i) resource_spawn(s);
}


static void phase_see(Sim *s) {
    for (int32_t i = 0; i < s->bee_count; ++i) {
        Bee *b = &s->bees[i];

        for (int32_t k = 0; k < GOAL_COUNT; ++k) {
            Belief *bl = &b->belief[k];
            if (!bl->valid) continue;
            bl->age += SIM_DT;

            if (bl->age >= KNOWLEDGE_TTL ||
                (!bl->direct &&
                 dist2(b->x, b->y, bl->x, bl->y) < GOAL_REACHED_RADIUS * GOAL_REACHED_RADIUS))
                belief_clear(bl);
            else
                bl->direct = 0;
        }

        float d = sqrtf(dist2(b->x, b->y, s->hive_x, s->hive_y));
        if (d <= VIEW_RADIUS)
            b->belief[GOAL_HIVE] = (Belief){s->hive_x, s->hive_y, 0.0f, 0.0f, 1, 1};
        int32_t ri = nearest_resource(s, b->x, b->y, VIEW_RADIUS);
        if (ri >= 0)
            b->belief[GOAL_RESOURCE] =
                (Belief){s->resources[ri].x, s->resources[ri].y, 0.0f, 0.0f, 1, 1};
    }
}


static void phase_hear(Sim *s) {
    const float hear2 = HEAR_RADIUS * HEAR_RADIUS;

    for (int32_t i = 0; i < s->bee_count; ++i)
        for (int32_t k = 0; k < GOAL_COUNT; ++k) {
            const Belief *bl = &s->bees[i].belief[k];
            s->shout[i][k] = (Shout){s->bees[i].x, s->bees[i].y, estimate(&s->bees[i], bl), bl->age,
                                     bl->valid};
        }

    for (int32_t i = 0; i < s->bee_count; ++i) {
        Bee *b = &s->bees[i];
        for (int32_t k = 0; k < GOAL_COUNT; ++k) {
            Belief *bl = &b->belief[k];
            if (bl->direct) continue;

            float own = bl->valid ? estimate(b, bl) : BIG_DIST;
            const Shout *best = 0;
            for (int32_t j = 0; j < s->bee_count; ++j) {
                const Shout *sh = &s->shout[j][k];
                if (j == i || !sh->valid) continue;
                if (bl->valid && sh->age > bl->age) continue;
                float d2 = dist2(b->x, b->y, sh->x, sh->y);
                if (d2 > hear2) continue;
                float cand = sh->dist + sqrtf(d2);
                if (cand <= own + 1.0e-3f) {
                    own = cand;
                    best = sh;
                }
            }
            if (best) *bl = (Belief){best->x, best->y, best->dist, best->age, 1, 0};
        }
    }
}


static void phase_move(Sim *s, float dt) {
    const float max_turn = BEE_TURN_RATE * dt;
    const float wander = sqrtf(3.0f * (BEE_SPEED / WANDER_PERSISTENCE) * dt);

    for (int32_t i = 0; i < s->bee_count; ++i) {
        Bee *b = &s->bees[i];
        const Belief *goal = b->scout ? 0 : &b->belief[bee_goal(b)];

        if (goal && goal->valid) {
            float turn = angle_diff(atan2f(goal->y - b->y, goal->x - b->x), b->heading);
            if (turn > max_turn) turn = max_turn;
            if (turn < -max_turn) turn = -max_turn;
            b->heading += turn;
        } else {
            b->heading += rng_range(s, -wander, wander);
        }

        b->x += cosf(b->heading) * BEE_SPEED * dt;
        b->y += sinf(b->heading) * BEE_SPEED * dt;

        if (b->x < 1.0f) { b->x = 1.0f; b->heading = PI_F - b->heading; }
        if (b->x > WORLD_W - 1.0f) { b->x = WORLD_W - 1.0f; b->heading = PI_F - b->heading; }
        if (b->y < 1.0f) { b->y = 1.0f; b->heading = -b->heading; }
        if (b->y > WORLD_H - 1.0f) { b->y = WORLD_H - 1.0f; b->heading = -b->heading; }

        if (b->scout) continue;

        if (b->carrying) {
            if (fabsf(b->x - s->hive_x) <= HIVE_SIZE * 0.5f &&
                fabsf(b->y - s->hive_y) <= HIVE_SIZE * 0.5f) {
                b->carrying = 0;
                s->delivered++;
            }
        } else {
            int32_t ri = nearest_resource(s, b->x, b->y, PICKUP_RADIUS);
            if (ri >= 0) {
                b->carrying = 1;
                if (--s->resources[ri].hp <= 0) {
                    s->resources[ri].alive = 0;
                    belief_clear(&b->belief[GOAL_RESOURCE]);
                }
            }
        }
    }
}

void sim_step(Sim *s, float dt) {
    s->time += dt;
    s->spawn_timer += dt;
    while (s->spawn_timer >= RESOURCE_SPAWN_PERIOD) {
        s->spawn_timer -= RESOURCE_SPAWN_PERIOD;
        resource_spawn(s);
    }
    phase_see(s);
    phase_hear(s);
    phase_move(s, dt);
}
