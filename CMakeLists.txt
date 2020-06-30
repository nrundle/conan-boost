cmake_minimum_required (VERSION 3.13.4)
project (ConanBoost)

add_definitions("-std=c++11")
#SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(conan_boost main.cpp)
target_link_libraries(conan_boost ${CONAN_LIBS})
