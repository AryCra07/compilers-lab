cmake_minimum_required(VERSION 3.20)
project(LexParser)

set(CMAKE_CXX_STANDARD 11)

include_directories(include)

add_executable(
        main
        src/main.cpp
)
