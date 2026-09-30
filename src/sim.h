#ifndef SIM_H
#define SIM_H

#define SIM_X_SIZE 1280
#define SIM_Y_SIZE 720

typedef struct Sim Sim;

Sim *simInit(void);
void simExit(Sim *s);
void app(Sim *s);
int simFlush(Sim *s);
void simPutPixel(Sim *s, int x, int y, int argb);
int simRand(Sim *s);
int simClicks(Sim *s);

#endif
