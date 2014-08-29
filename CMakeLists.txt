project(cylinder C CXX)
cmake_minimum_required(VERSION 2.8.9)

set (UBUNTU_PROJECT_TYPE "ClickApp" CACHE INTERNAL "Tells QtCreator this is a Click application project")
set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(Qt5Core)
find_package(Qt5Qml)
find_package(Qt5Quick)
find_package(Qt5DBus)
find_package(Qt5Widgets)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

execute_process(
    COMMAND dpkg-architecture -qDEB_HOST_MULTIARCH
    OUTPUT_VARIABLE ARCH_TRIPLET
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
set(QT_IMPORTS_DIR "lib/${ARCH_TRIPLET}")

set(APP_NAME          cylinder)
set(ICON              "cylinder.png")

# Standard install paths
include(GNUInstallDirs)

set(CMAKE_INSTALL_PREFIX /)
set(DATA_DIR /)
set(DESKTOP_DIR ${DATA_DIR})

qt5_add_resources(UI_RESOURCES cylinder.qrc)
add_executable(cylinder main.cpp cylinderview.cpp ${UI_RESOURCES} latte.png cupTexture.png)

qt5_use_modules(cylinder Widgets 3D)


#set install paths
if(CLICK_MODE)
  set(CMAKE_INSTALL_PREFIX "/")
  set(CYLINDER_DIR    "${CMAKE_INSTALL_DATADIR}")

  set(QT_IMPORTS_DIR "${CMAKE_INSTALL_LIBDIR}")
  set(EXEC "cylinder")
  set(MODULE_PATH ${QT_IMPORTS_DIR})
else(CLICK_MODE)
set(CYLINDER_DIR "${CMAKE_INSTALL_DATADIR}/cylinder")
  execute_process(
    COMMAND qmake -query QT_INSTALL_QML
            OUTPUT_VARIABLE QT_IMPORTS_DIR
            OUTPUT_STRIP_TRAILING_WHITESPACE
    )
set(MODULE_PATH ${QT_IMPORTS_DIR}/cylinder)
endif(CLICK_MODE)
