CC      ?= gcc
CFLAGS  ?= -O2 -g -std=c11 -Wall -Wextra -Wpedantic -Wshadow -Wconversion -Wno-sign-conversion
LDLIBS  += -lm
SDL_CFLAGS := $(shell pkg-config --cflags sdl2 2>/dev/null)
SDL_LIBS   := $(shell pkg-config --libs sdl2 2>/dev/null || echo -lSDL2)

all: beesim

beesim: src/main.c src/sim.c src/sim.h
	$(CC) $(CFLAGS) $(SDL_CFLAGS) -o $@ $(filter %.c,$^) $(SDL_LIBS) $(LDLIBS)

run: beesim
	./beesim

clean:
	rm -f beesim

.PHONY: all run clean
