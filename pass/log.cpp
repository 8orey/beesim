#include "Logger.hpp"

namespace {
Logger logger(20'000'000, "stats/trace.txt");
}

extern "C" void useLogger(const char *user, const char *operand) {
  logger.println("{} <- {}", user, operand);
}
