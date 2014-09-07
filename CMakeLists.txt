project(cylinder C CXX)
cmake_minimum_required(VERSION 2.8.9)

set (UBUNTU_PROJECT_TYPE "ClickApp" CACHE INTERNAL "Tells QtCreator this is a Click application project")
set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(Qt5Core)
find_package(Qt5Qml)
find_package(Qt5Quick)
#find_package(ubuntu-sdk-libs)

#automatically create moc files
set(CMAKE_AUTOMOC ON)

# components PATH
execute_process(
    COMMAND dpkg-architecture -qDEB_HOST_MULTIARCH
    OUTPUT_VARIABLE ARCH_TRIPLET
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(QT_IMPORTS_DIR "lib/${ARCH_TRIPLET}")

option(INSTALL_TESTS "Install the tests on make install" on)

set(APP_NAME          cylinder)
set(ICON              "cylinder.png")
set(EXEC              "cylinder")

#set install paths
set(CMAKE_INSTALL_PREFIX /)

# make the source files visible on qtcreator
file(GLOB SOURCES src/*.cpp src/*.h)
add_custom_target(cylinder_sources ALL SOURCES ${SOURCES})

# make the meta files visible on qtcreator
file(GLOB META_FILES cylinder.png cylinder.desktop cylinder.apparmor)
add_custom_target(cylinder_metafiles ALL SOURCES ${META_FILES})

# Install meta files
install(FILES cylinder.desktop DESTINATION ${CMAKE_INSTALL_PREFIX})
install(FILES manifest.json DESTINATION ${CMAKE_INSTALL_PREFIX})
install(FILES ${ICON} DESTINATION ${CMAKE_INSTALL_PREFIX})
install(FILES "cylinder.apparmor" DESTINATION ${CMAKE_INSTALL_PREFIX})

# Build binary
qt5_add_resources(UI_RESOURCES src/resources/cylinder.qrc)
add_executable(cylinder
               src/main.cpp
               src/cylinderview.cpp
               ${UI_RESOURCES}
               src/resources/latte.png
               src/resources/cupTexture.png)
qt5_use_modules(cylinder Widgets 3D)

# Install binary
install_targets(${CMAKE_INSTALL_PREFIX} cylinder)
#install(FILES ${CMAKE_CURRENT_BINARY_DIR}/cylinder DESTINATION ${CMAKE_INSTALL_PREFIX})


add_custom_target("check" cylinder
                    DEPENDS cylinder
                    WORKING_DIRECTORY .)

add_custom_target("run" cylinder
                    DEPENDS cylinder
                    WORKING_DIRECTORY .)

add_custom_target("cylinder_ClickFiles" ALL SOURCES "cylinder.apparmor" "manifest.json")

