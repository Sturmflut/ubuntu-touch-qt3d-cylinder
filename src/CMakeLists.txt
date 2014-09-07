file(GLOB SOURCES *.cpp *.h)

# make the files visible on qtcreator
add_custom_target(cylinder_sources ALL SOURCES ${SOURCES})

#substitute variables in the desktop file
set(DESKTOP_FILE "cylinder.desktop")
configure_file(${DESKTOP_FILE}.in ${CMAKE_CURRENT_BINARY_DIR}/${DESKTOP_FILE})

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${DESKTOP_FILE} DESTINATION ${DESKTOP_DIR})

