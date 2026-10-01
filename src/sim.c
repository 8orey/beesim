#include <SDL2/SDL.h>
#include <assert.h>
#include <time.h>

#include "sim.h"

#define FRAME_MS 16

struct Sim {
    SDL_Window *window;
    SDL_Renderer *renderer;
    SDL_Texture *texture;
    Uint32 *pixels;
    int pitch;
    Uint32 last_flush;
    unsigned rng;
    int clicks;
    int quit;
};

static struct Sim sim;

static void lock(void) {
    void *pixels;
    SDL_LockTexture(sim.texture, NULL, &pixels, &sim.pitch);
    sim.pixels = pixels;
}

static void poll(void) {
    SDL_Event e;
    while (SDL_PollEvent(&e)) {
        if (e.type == SDL_QUIT) sim.quit = 1;
        if (e.type == SDL_MOUSEBUTTONDOWN) sim.clicks++;
    }
}

int simInit(void) {
    if (SDL_Init(SDL_INIT_VIDEO) != 0) return 0;
    SDL_CreateWindowAndRenderer(SIM_X_SIZE, SIM_Y_SIZE, 0, &sim.window, &sim.renderer);
    if (sim.renderer)
        sim.texture = SDL_CreateTexture(sim.renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STREAMING,
                                        SIM_X_SIZE, SIM_Y_SIZE);
    if (!sim.texture) {
        simExit();
        return 0;
    }
    SDL_SetWindowTitle(sim.window, "beesim");
    sim.rng = (unsigned)time(NULL) | 1u;
    sim.last_flush = SDL_GetTicks();
    lock();
    return 1;
}

void simExit(void) {
    if (sim.texture) SDL_DestroyTexture(sim.texture);
    if (sim.renderer) SDL_DestroyRenderer(sim.renderer);
    if (sim.window) SDL_DestroyWindow(sim.window);
    SDL_Quit();
    sim = (struct Sim){0};
}

int simFlush(void) {
    SDL_UnlockTexture(sim.texture);
    SDL_RenderCopy(sim.renderer, sim.texture, NULL, NULL);
    SDL_RenderPresent(sim.renderer);
    Uint32 elapsed = SDL_GetTicks() - sim.last_flush;
    if (elapsed < FRAME_MS) SDL_Delay(FRAME_MS - elapsed);
    sim.last_flush = SDL_GetTicks();
    lock();
    poll();
    return !sim.quit;
}

void simPutPixel(int x, int y, int argb) {
    assert(0 <= x && x < SIM_X_SIZE && "Out of range");
    assert(0 <= y && y < SIM_Y_SIZE && "Out of range");
    sim.pixels[y * (sim.pitch / 4) + x] = (Uint32)argb;
}

int simRand(void) {
    unsigned x = sim.rng;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    sim.rng = x;
    return (int)(x >> 1);
}

int simClicks(void) {
    poll();
    int n = sim.clicks;
    sim.clicks = 0;
    return n;
}
