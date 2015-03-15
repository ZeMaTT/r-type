##
## CMAKE file for r-type/server
##

cmake_minimum_required(VERSION 2.8)

include_directories(./header/)

set(sources
	src/client.cpp
	)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake_modules" ${CMAKE_MODULE_PATH})
set(SFML_ROOT "../ext/src/SFML-2.2")
find_package(SFML 2.2 REQUIRED system window graphics audio)
#set(SFML_ROOT "../ext/src/SFML-2.2/include")

## if (WIN32)
##   file(COPY ${SFML_DIR}/bin/libsndfile-1.dll DESTINATION ${CMAKE_BINARY_DIR})
##   file(COPY ${SFML_DIR}/bin/openal32.dll DESTINATION ${CMAKE_BINARY_DIR})
##   file(COPY ${SFML_DIR}/bin/sfml-audio-2.dll DESTINATION ${CMAKE_BINARY_DIR})
##   file(COPY ${SFML_DIR}/bin/sfml-graphics-2.dll DESTINATION ${CMAKE_BINARY_DIR})
##   file(COPY ${SFML_DIR}/bin/sfml-network-2.dll DESTINATION ${CMAKE_BINARY_DIR})
##   file(COPY ${SFML_DIR}/bin/sfml-system-2.dll DESTINATION ${CMAKE_BINARY_DIR})
##   file(COPY ${SFML_DIR}/bin/sfml-window-2.dll DESTINATION ${CMAKE_BINARY_DIR})
## endif()

include_directories(${SFML_INCLUDE_DIR})

add_definitions(-pthread)
#add_definitions(-DSFML_STATIC -pthread)
add_executable(client ${sources})

target_link_libraries(client
	${SFML_AUDIO_LIBRARY_RELEASE}
	${SFML_WINDOW_LIBRARY_RELEASE}
	${SFML_GRAPHICS_LIBRARY_RELEASE}
	${SFML_SYSTEM_LIBRARY_RELEASE}
	#common
	)