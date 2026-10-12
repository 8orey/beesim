cmake_minimum_required(VERSION 3.21)
project(beesim C CXX)

find_package(LLVM REQUIRED CONFIG)
find_package(SDL2 REQUIRED CONFIG)

add_library(platform OBJECT src/start.c src/sim.c)
target_link_libraries(platform PUBLIC SDL2::SDL2)

add_executable(beesim src/app.c)
target_link_libraries(beesim PRIVATE platform)

add_subdirectory(pass)
