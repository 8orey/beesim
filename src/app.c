#include <math.h>

#include "sim.h"

#define BEE_COUNT 120
#define SCOUT_EVERY 20
#define VIEW_RADIUS 40.0f
#define HEAR_RADIUS 130.0f
#define BEE_SPEED 110.0f
#define BEE_TURN_RATE 6.0f
#define WANDER_PERSISTENCE 200.0f
#define KNOWLEDGE_TTL 3.0f
#define PICKUP_RADIUS 7.0f
#define GOAL_REACHED_RADIUS 6.0f
#define HIVE_SIZE 48.0f
#define HIVE_X (SIM_X_SIZE / 2.0f)
#define HIVE_Y (SIM_Y_SIZE / 2.0f)
#define MAX_RESOURCES 8
#define RESOURCE_HP 70
#define RESOURCE_RADIUS_MIN 8.0f
#define RESOURCE_RADIUS_MAX 26.0f
#define RESOURCE_SPAWN_PERIOD 10.0f
#define RESOURCE_START_COUNT 2
#define RESOURCE_MIN_HIVE_DIST 200.0f
#define DT (1.0f / 60.0f)
#define PI_F 3.14159265358979f
#define BIG_DIST 1.0e30f

#define COLOR_BG ((int)0xFF121218u)
#define COLOR_HIVE ((int)0xFFF0C828u)
#define COLOR_PATCH ((int)0xFF3CC85Au)
#define COLOR_SEARCH ((int)0xFFE1E1EBu)
#define COLOR_CARRY ((int)0xFFFF8C28u)
#define COLOR_SCOUT ((int)0xFF50BEFFu)
#define COLOR_SEEN ((int)0xFF466E46u)
#define COLOR_RUMOUR ((int)0xFF464682u)

enum { GOAL_RESOURCE, GOAL_HIVE, GOAL_COUNT };

typedef struct {
    float x, y, rest, age;
    int valid, direct;
} Belief;

typedef struct {
    float x, y, heading;
    Belief belief[GOAL_COUNT];
    int carrying, scout;
} Bee;

typedef struct {
    float x, y;
    int hp, alive;
} Resource;

typedef struct {
    float x, y, dist, age;
    int valid;
} Shout;

typedef struct {
    Bee bees[BEE_COUNT];
    Resource resources[MAX_RESOURCES];
    Shout shouts[BEE_COUNT][GOAL_COUNT];
    float spawn_timer;
} World;

static float rnd(Sim *sim, float lo, float hi) {
    return lo + (hi - lo) * (float)(simRand(sim) & 0xFFFF) / 65536.0f;
}

static float dist2(float ax, float ay, float bx, float by) {
    float dx = ax - bx, dy = ay - by;
    return dx * dx + dy * dy;
}

static float angle_diff(float target, float cur) {
    float d = target - cur;
    while (d > PI_F) d -= 2.0f * PI_F;
    while (d < -PI_F) d += 2.0f * PI_F;
    return d;
}

static int goal_of(const Bee *b) { return b->carrying ? GOAL_HIVE : GOAL_RESOURCE; }

static void belief_clear(Belief *bl) { *bl = (Belief){0.0f, 0.0f, BIG_DIST, 0.0f, 0, 0}; }

static float estimate(const Bee *b, const Belief *bl) {
    return sqrtf(dist2(b->x, b->y, bl->x, bl->y)) + bl->rest;
}

static float resource_radius(const Resource *r) {
    float f = (float)r->hp / (float)RESOURCE_HP;
    return RESOURCE_RADIUS_MIN + (RESOURCE_RADIUS_MAX - RESOURCE_RADIUS_MIN) * sqrtf(f < 0.0f ? 0.0f : f);
}

static int nearest_resource(const World *w, float x, float y, float reach) {
    float best = reach;
    int bi = -1;
    for (int i = 0; i < MAX_RESOURCES; ++i) {
        const Resource *r = &w->resources[i];
        if (!r->alive) continue;
        float d = sqrtf(dist2(x, y, r->x, r->y)) - resource_radius(r);
        if (d < best) {
            best = d;
            bi = i;
        }
    }
    return bi;
}

static void resource_spawn(World *w, Sim *sim) {
    for (int i = 0; i < MAX_RESOURCES; ++i) {
        if (w->resources[i].alive) continue;
        for (int tries = 0; tries < 16; ++tries) {
            float x = rnd(sim, RESOURCE_RADIUS_MAX, SIM_X_SIZE - RESOURCE_RADIUS_MAX);
            float y = rnd(sim, RESOURCE_RADIUS_MAX, SIM_Y_SIZE - RESOURCE_RADIUS_MAX);
            if (dist2(x, y, HIVE_X, HIVE_Y) < RESOURCE_MIN_HIVE_DIST * RESOURCE_MIN_HIVE_DIST) continue;
            w->resources[i] = (Resource){x, y, RESOURCE_HP, 1};
            return;
        }
        return;
    }
}

static void init(World *w, Sim *sim) {
    for (int i = 0; i < BEE_COUNT; ++i) {
        Bee *b = &w->bees[i];
        float a = rnd(sim, 0.0f, 2.0f * PI_F), r = rnd(sim, 0.0f, HIVE_SIZE);
        b->x = HIVE_X + cosf(a) * r;
        b->y = HIVE_Y + sinf(a) * r;
        b->heading = rnd(sim, 0.0f, 2.0f * PI_F);
        b->scout = i % SCOUT_EVERY == 0;
        belief_clear(&b->belief[GOAL_RESOURCE]);
        belief_clear(&b->belief[GOAL_HIVE]);
    }
    for (int i = 0; i < RESOURCE_START_COUNT; ++i) resource_spawn(w, sim);
}

static void see(World *w) {
    for (int i = 0; i < BEE_COUNT; ++i) {
        Bee *b = &w->bees[i];
        for (int k = 0; k < GOAL_COUNT; ++k) {
            Belief *bl = &b->belief[k];
            if (!bl->valid) continue;
            bl->age += DT;
            if (bl->age >= KNOWLEDGE_TTL ||
                (!bl->direct && dist2(b->x, b->y, bl->x, bl->y) < GOAL_REACHED_RADIUS * GOAL_REACHED_RADIUS))
                belief_clear(bl);
            else
                bl->direct = 0;
        }
        if (dist2(b->x, b->y, HIVE_X, HIVE_Y) <= VIEW_RADIUS * VIEW_RADIUS)
            b->belief[GOAL_HIVE] = (Belief){HIVE_X, HIVE_Y, 0.0f, 0.0f, 1, 1};
        int ri = nearest_resource(w, b->x, b->y, VIEW_RADIUS);
        if (ri >= 0)
            b->belief[GOAL_RESOURCE] = (Belief){w->resources[ri].x, w->resources[ri].y, 0.0f, 0.0f, 1, 1};
    }
}

static void hear(World *w) {
    for (int i = 0; i < BEE_COUNT; ++i)
        for (int k = 0; k < GOAL_COUNT; ++k) {
            const Bee *b = &w->bees[i];
            const Belief *bl = &b->belief[k];
            w->shouts[i][k] = (Shout){b->x, b->y, estimate(b, bl), bl->age, bl->valid};
        }

    for (int i = 0; i < BEE_COUNT; ++i) {
        Bee *b = &w->bees[i];
        for (int k = 0; k < GOAL_COUNT; ++k) {
            Belief *bl = &b->belief[k];
            if (bl->direct) continue;
            float own = bl->valid ? estimate(b, bl) : BIG_DIST;
            const Shout *best = 0;
            for (int j = 0; j < BEE_COUNT; ++j) {
                const Shout *sh = &w->shouts[j][k];
                if (j == i || !sh->valid) continue;
                if (bl->valid && sh->age > bl->age) continue;
                float d2 = dist2(b->x, b->y, sh->x, sh->y);
                if (d2 > HEAR_RADIUS * HEAR_RADIUS) continue;
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

static void move(World *w, Sim *sim) {
    const float max_turn = BEE_TURN_RATE * DT;
    const float wander = sqrtf(3.0f * (BEE_SPEED / WANDER_PERSISTENCE) * DT);

    for (int i = 0; i < BEE_COUNT; ++i) {
        Bee *b = &w->bees[i];
        const Belief *goal = b->scout ? 0 : &b->belief[goal_of(b)];

        if (goal && goal->valid) {
            float turn = angle_diff(atan2f(goal->y - b->y, goal->x - b->x), b->heading);
            if (turn > max_turn) turn = max_turn;
            if (turn < -max_turn) turn = -max_turn;
            b->heading += turn;
        } else {
            b->heading += rnd(sim, -wander, wander);
        }

        b->x += cosf(b->heading) * BEE_SPEED * DT;
        b->y += sinf(b->heading) * BEE_SPEED * DT;

        if (b->x < 1.0f) { b->x = 1.0f; b->heading = PI_F - b->heading; }
        if (b->x > SIM_X_SIZE - 2.0f) { b->x = SIM_X_SIZE - 2.0f; b->heading = PI_F - b->heading; }
        if (b->y < 1.0f) { b->y = 1.0f; b->heading = -b->heading; }
        if (b->y > SIM_Y_SIZE - 2.0f) { b->y = SIM_Y_SIZE - 2.0f; b->heading = -b->heading; }

        if (b->scout) continue;

        if (b->carrying) {
            if (fabsf(b->x - HIVE_X) <= HIVE_SIZE / 2 && fabsf(b->y - HIVE_Y) <= HIVE_SIZE / 2) b->carrying = 0;
        } else {
            int ri = nearest_resource(w, b->x, b->y, PICKUP_RADIUS);
            if (ri >= 0) {
                b->carrying = 1;
                if (--w->resources[ri].hp <= 0) {
                    w->resources[ri].alive = 0;
                    belief_clear(&b->belief[GOAL_RESOURCE]);
                }
            }
        }
    }
}

static void step(World *w, Sim *sim) {
    w->spawn_timer += DT;
    if (w->spawn_timer >= RESOURCE_SPAWN_PERIOD) {
        w->spawn_timer -= RESOURCE_SPAWN_PERIOD;
        resource_spawn(w, sim);
    }
    see(w);
    hear(w);
    move(w, sim);
}

static void put(Sim *sim, int x, int y, int color) {
    if (x >= 0 && y >= 0 && x < SIM_X_SIZE && y < SIM_Y_SIZE) simPutPixel(sim, x, y, color);
}

static void fill_rect(Sim *sim, int x0, int y0, int w, int h, int color) {
    for (int y = y0; y < y0 + h; ++y)
        for (int x = x0; x < x0 + w; ++x) put(sim, x, y, color);
}

static void disc(Sim *sim, float cx, float cy, float radius, int color) {
    int r = (int)radius;
    for (int y = -r; y <= r; ++y)
        for (int x = -r; x <= r; ++x)
            if (x * x + y * y <= r * r) put(sim, (int)cx + x, (int)cy + y, color);
}

static void line(Sim *sim, float x0, float y0, float x1, float y1, int color) {
    int n = (int)fmaxf(fabsf(x1 - x0), fabsf(y1 - y0));
    for (int i = 0; i <= n; ++i) {
        float t = n ? (float)i / (float)n : 0.0f;
        put(sim, (int)(x0 + (x1 - x0) * t), (int)(y0 + (y1 - y0) * t), color);
    }
}

static void draw(const World *w, Sim *sim, int show_beliefs) {
    fill_rect(sim, 0, 0, SIM_X_SIZE, SIM_Y_SIZE, COLOR_BG);
    fill_rect(sim, (int)(HIVE_X - HIVE_SIZE / 2), (int)(HIVE_Y - HIVE_SIZE / 2), (int)HIVE_SIZE, (int)HIVE_SIZE,
              COLOR_HIVE);
    for (int i = 0; i < MAX_RESOURCES; ++i) {
        const Resource *r = &w->resources[i];
        if (r->alive) disc(sim, r->x, r->y, resource_radius(r), COLOR_PATCH);
    }
    for (int i = 0; i < BEE_COUNT && show_beliefs; ++i) {
        const Bee *b = &w->bees[i];
        const Belief *bl = &b->belief[goal_of(b)];
        if (!b->scout && bl->valid) line(sim, b->x, b->y, bl->x, bl->y, bl->direct ? COLOR_SEEN : COLOR_RUMOUR);
    }
    for (int i = 0; i < BEE_COUNT; ++i) {
        const Bee *b = &w->bees[i];
        fill_rect(sim, (int)b->x - 1, (int)b->y - 1, 3, 3,
                  b->scout ? COLOR_SCOUT : b->carrying ? COLOR_CARRY : COLOR_SEARCH);
    }
}

void app(Sim *sim) {
    World world = {0};
    int show_beliefs = 0;
    init(&world, sim);
    do {
        if (simClicks(sim) % 2) show_beliefs = !show_beliefs;
        step(&world, sim);
        draw(&world, sim, show_beliefs);
    } while (simFlush(sim));
}
