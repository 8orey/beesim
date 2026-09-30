#include <SDL2/SDL.h>
#include <assert.h>
#include <stdlib.h>
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

static void lock(Sim *s) {
    void *pixels;
    SDL_LockTexture(s->texture, NULL, &pixels, &s->pitch);
    s->pixels = pixels;
}

static void poll(Sim *s) {
    SDL_Event e;
    while (SDL_PollEvent(&e)) {
        if (e.type == SDL_QUIT) s->quit = 1;
        if (e.type == SDL_MOUSEBUTTONDOWN) s->clicks++;
    }
}

Sim *simInit(void) {
    Sim *s = calloc(1, sizeof(*s));
    if (!s || SDL_Init(SDL_INIT_VIDEO) != 0) {
        free(s);
        return NULL;
    }
    SDL_CreateWindowAndRenderer(SIM_X_SIZE, SIM_Y_SIZE, 0, &s->window, &s->renderer);
    if (s->renderer)
        s->texture = SDL_CreateTexture(s->renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STREAMING,
                                       SIM_X_SIZE, SIM_Y_SIZE);
    if (!s->texture) {
        simExit(s);
        return NULL;
    }
    SDL_SetWindowTitle(s->window, "beesim");
    s->rng = (unsigned)time(NULL) | 1u;
    s->last_flush = SDL_GetTicks();
    lock(s);
    return s;
}

void simExit(Sim *s) {
    if (s->texture) SDL_DestroyTexture(s->texture);
    if (s->renderer) SDL_DestroyRenderer(s->renderer);
    if (s->window) SDL_DestroyWindow(s->window);
    SDL_Quit();
    free(s);
}

int simFlush(Sim *s) {
    SDL_UnlockTexture(s->texture);
    SDL_RenderCopy(s->renderer, s->texture, NULL, NULL);
    SDL_RenderPresent(s->renderer);
    Uint32 elapsed = SDL_GetTicks() - s->last_flush;
    if (elapsed < FRAME_MS) SDL_Delay(FRAME_MS - elapsed);
    s->last_flush = SDL_GetTicks();
    lock(s);
    poll(s);
    return !s->quit;
}

void simPutPixel(Sim *s, int x, int y, int argb) {
    assert(0 <= x && x < SIM_X_SIZE && "Out of range");
    assert(0 <= y && y < SIM_Y_SIZE && "Out of range");
    s->pixels[y * (s->pitch / 4) + x] = (Uint32)argb;
}

int simRand(Sim *s) {
    unsigned x = s->rng;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    s->rng = x;
    return (int)(x >> 1);
}

int simClicks(Sim *s) {
    poll(s);
    int n = s->clicks;
    s->clicks = 0;
    return n;
}
