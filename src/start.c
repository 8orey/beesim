#include "sim.h"

int main(void) {
    if (!simInit()) return 1;
    app();
    simExit();
    return 0;
}
