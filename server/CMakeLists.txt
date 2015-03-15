##
## CMAKE file for r-type/server
##

cmake_minimum_required(VERSION 2.8)

set(sources
	src/server.cpp
	)
	
set(unix_sources 
	${sources}
	)

set(windows_sources 
	${sources}
	)

include_directories(./header/)


add_definitions(-pthread)
if (UNIX)
  add_executable(server ${unix_sources})
  target_link_libraries(server -lpthread -lrt -ldl)
else ()
  add_executable(server ${windows_sources})
endif()

# target_link_libraries(server common)
