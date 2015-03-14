##
## CMAKE file for r-type/server
##

set(sources
	src/client.cpp
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
