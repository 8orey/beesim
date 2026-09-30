#include "sim.h"

int main(void) {
    Sim *sim = simInit();
    if (!sim) return 1;
    app(sim);
    simExit(sim);
    return 0;
}
