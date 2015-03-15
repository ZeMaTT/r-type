##
## CMAKE file for r-type
##

cmake_minimum_required(VERSION 2.8)
project(r_type)

set(myproject_VERSION_MAJOR 0)
set(myproject_VERSION_MINOR 0)

add_definitions(-Wno-narrowing)
add_definitions(-Wno-type-limits)
add_definitions(-Wno-unused-parameter)

if (WIN32)
  add_definitions(-D__WINDOWS__)
else ()
  add_definitions(-D__UNIX__)
endif()

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake_modules")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/build")

add_subdirectory(server)
add_subdirectory(client)
