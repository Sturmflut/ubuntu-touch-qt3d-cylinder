project(cylinder C CXX)

cmake_minimum_required(VERSION 2.8.8)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt5Core)
find_package(Qt5Qml)
find_package(Qt5Quick)
find_package(Qt5DBus)
find_package(Qt5Widgets)

qt5_add_resources(UI_RESOURCES cylinder.qrc)
add_executable(cylinder main.cpp cylinderview.cpp ${UI_RESOURCES} latte.png cupTexture.png)

qt5_use_modules(cylinder Widgets 3D)
