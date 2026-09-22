#ifndef BEESIM_SIM_H
#define BEESIM_SIM_H

#include <stdint.h>

#define WORLD_W 1280
#define WORLD_H 720

#define BEE_COUNT 120
#define MAX_BEES 256
#define SCOUT_EVERY 20

#define VIEW_RADIUS 40.0f
#define HEAR_RADIUS 130.0f
#define BEE_SPEED 110.0f
#define BEE_TURN_RATE 6.0f
#ifndef WANDER_PERSISTENCE
#define WANDER_PERSISTENCE 200.0f
#endif
#ifndef KNOWLEDGE_TTL
#define KNOWLEDGE_TTL 3.0f
#endif
#define PICKUP_RADIUS 7.0f
#define GOAL_REACHED_RADIUS 6.0f

#define HIVE_SIZE 48.0f
#define MAX_RESOURCES 8
#ifndef RESOURCE_HP
#define RESOURCE_HP 70
#endif
#define RESOURCE_RADIUS_MIN 8.0f
#define RESOURCE_RADIUS_MAX 26.0f
#define RESOURCE_SPAWN_PERIOD 10.0f
#define RESOURCE_START_COUNT 2
#define RESOURCE_MIN_HIVE_DIST 200.0f

#define SIM_DT (1.0f / 60.0f)

typedef enum { GOAL_RESOURCE = 0, GOAL_HIVE = 1, GOAL_COUNT = 2 } GoalKind;

typedef struct {
  float x, y;
  float rest;
  float age;
  uint8_t valid;
  uint8_t direct;
} Belief;

typedef struct {
  float x, y;
  float heading;
  Belief belief[GOAL_COUNT];
  uint8_t carrying;
  uint8_t scout;
} Bee;

typedef struct {
  float x, y;
  int32_t hp;
  uint8_t alive;
} Resource;

typedef struct {
  float x, y;
  float dist;
  float age;
  uint8_t valid;
} Shout;

typedef struct {
  Bee bees[MAX_BEES];
  int32_t bee_count;
  Resource resources[MAX_RESOURCES];
  float hive_x, hive_y;
  float spawn_timer, time;
  int32_t delivered;
  uint32_t rng;
  Shout shout[MAX_BEES][GOAL_COUNT];
} Sim;

void sim_init(Sim *s, uint32_t seed);
void sim_step(Sim *s, float dt);
float resource_radius(const Resource *r);

static inline GoalKind bee_goal(const Bee *b) {
  return b->carrying ? GOAL_HIVE : GOAL_RESOURCE;
}

#endif
