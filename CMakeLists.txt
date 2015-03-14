cmake_minimum_required(VERSION 3.1)
project(r_type)

add_definitions(-Wno-narrowing)
add_definitions(-Wno-type-limits)
add_definitions(-Wno-unused-parameter)

if (WIN32)
  add_definitions(-D__WINDOWS__)
else ()
  add_definitions(-D__UNIX__)
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

add_subdirectory(server)
add_subdirectory(client)
