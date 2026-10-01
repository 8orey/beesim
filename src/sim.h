#ifndef SIM_H
#define SIM_H

#define SIM_X_SIZE 1280
#define SIM_Y_SIZE 720

int simInit(void);
void simExit(void);
void app(void);
int simFlush(void);
void simPutPixel(int x, int y, int argb);
int simRand(void);
int simClicks(void);

#endif
