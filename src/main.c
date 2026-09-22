#include <SDL2/SDL.h>
#include <stdio.h>

#include "sim.h"


static Sim g_sim;
static SDL_Point g_ring[48];

static void draw_circle(SDL_Renderer *r, float cx, float cy, float rad) {
    const int n = (int)(sizeof(g_ring) / sizeof(g_ring[0]));
    for (int i = 0; i < n; ++i) {
        float a = (float)i * (6.28318531f / (float)(n - 1));
        g_ring[i].x = (int)(cx + SDL_cosf(a) * rad);
        g_ring[i].y = (int)(cy + SDL_sinf(a) * rad);
    }
    SDL_RenderDrawLines(r, g_ring, n);
}

static void render(SDL_Renderer *r, int show_beliefs) {
    SDL_SetRenderDrawColor(r, 18, 18, 24, 255);
    SDL_RenderClear(r);

    SDL_Rect hive = {(int)(g_sim.hive_x - HIVE_SIZE * 0.5f), (int)(g_sim.hive_y - HIVE_SIZE * 0.5f),
                     (int)HIVE_SIZE, (int)HIVE_SIZE};
    SDL_SetRenderDrawColor(r, 240, 200, 40, 255);
    SDL_RenderFillRect(r, &hive);

    SDL_SetRenderDrawColor(r, 60, 200, 90, 255);
    for (int i = 0; i < MAX_RESOURCES; ++i)
        if (g_sim.resources[i].alive)
            draw_circle(r, g_sim.resources[i].x, g_sim.resources[i].y,
                        resource_radius(&g_sim.resources[i]));

    
    if (show_beliefs)
        for (int i = 0; i < g_sim.bee_count; ++i) {
            const Bee *b = &g_sim.bees[i];
            const Belief *bl = &b->belief[bee_goal(b)];
            if (b->scout || !bl->valid) continue;
            if (bl->direct)
                SDL_SetRenderDrawColor(r, 70, 110, 70, 255);
            else
                SDL_SetRenderDrawColor(r, 70, 70, 130, 255);
            SDL_RenderDrawLine(r, (int)b->x, (int)b->y, (int)bl->x, (int)bl->y);
        }

    for (int i = 0; i < g_sim.bee_count; ++i) {
        const Bee *b = &g_sim.bees[i];
        if (b->scout)
            SDL_SetRenderDrawColor(r, 80, 190, 255, 255);
        else if (b->carrying)
            SDL_SetRenderDrawColor(r, 255, 140, 40, 255);
        else
            SDL_SetRenderDrawColor(r, 225, 225, 235, 255);
        SDL_Rect s = {(int)b->x - 1, (int)b->y - 1, 3, 3};
        SDL_RenderFillRect(r, &s);
    }

    SDL_RenderPresent(r);
}

int main(void) {
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fprintf(stderr, "SDL_Init: %s\n", SDL_GetError());
        return 1;
    }
    SDL_Window *win = SDL_CreateWindow("beesim", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                                       WORLD_W, WORLD_H, 0);
    SDL_Renderer *ren = win ? SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED |
                                                              SDL_RENDERER_PRESENTVSYNC)
                            : 0;
    if (!ren) ren = win ? SDL_CreateRenderer(win, -1, SDL_RENDERER_SOFTWARE) : 0;
    if (!ren) {
        fprintf(stderr, "SDL: %s\n", SDL_GetError());
        SDL_Quit();
        return 1;
    }

    sim_init(&g_sim, (uint32_t)SDL_GetTicks() | 1u);

    int running = 1, paused = 0, step_once = 0, show_beliefs = 0;
    float accumulator = 0.0f, title_timer = 0.0f;
    Uint64 prev = SDL_GetPerformanceCounter();
    const double freq = (double)SDL_GetPerformanceFrequency();
    char title[128];

    while (running) {
        SDL_Event e;
        while (SDL_PollEvent(&e)) {
            if (e.type == SDL_QUIT) running = 0;
            if (e.type != SDL_KEYDOWN) continue;
            switch (e.key.keysym.sym) {
                case SDLK_ESCAPE:
                case SDLK_q: running = 0; break;
                case SDLK_SPACE: paused = !paused; break;
                case SDLK_TAB: step_once = 1; break;
                case SDLK_r: sim_init(&g_sim, (uint32_t)SDL_GetTicks() | 1u); break;
                case SDLK_d: show_beliefs = !show_beliefs; break;
                default: break;
            }
        }

        Uint64 now = SDL_GetPerformanceCounter();
        float frame_dt = (float)((double)(now - prev) / freq);
        prev = now;
        if (frame_dt > 0.25f) frame_dt = 0.25f; 

        if (!paused) accumulator += frame_dt;
        if (step_once) {
            accumulator += SIM_DT;
            step_once = 0;
        }
        while (accumulator >= SIM_DT) {
            sim_step(&g_sim, SIM_DT);
            accumulator -= SIM_DT;
        }

        render(ren, show_beliefs);

        title_timer += frame_dt;
        if (title_timer > 0.25f) {
            title_timer = 0.0f;
            int patches = 0;
            for (int i = 0; i < MAX_RESOURCES; ++i) patches += g_sim.resources[i].alive;
            SDL_snprintf(title, sizeof(title), "beesim | patches %d | delivered %d | %.0f fps%s",
                         patches, g_sim.delivered, frame_dt > 0.0f ? 1.0f / frame_dt : 0.0f,
                         paused ? " | PAUSED" : "");
            SDL_SetWindowTitle(win, title);
        }
    }

    SDL_DestroyRenderer(ren);
    SDL_DestroyWindow(win);
    SDL_Quit();
    return 0;
}
