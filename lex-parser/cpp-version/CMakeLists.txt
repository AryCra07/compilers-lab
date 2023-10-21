cmake_minimum_required(VERSION 3.20)
project(LexParser)

set(CMAKE_CXX_STANDARD 11)

file(COPY ${CMAKE_SOURCE_DIR}/data DESTINATION ${CMAKE_BINARY_DIR})

include_directories(include)

add_executable(
        LexParser
        src/LexParser.cpp
        src/parser.cpp
)
