TEMPLATE = app
TARGET = cylinder
CONFIG += qt warn_on

CONFIG += qt3d_deploy_pkg
QT += 3d

include(../../../pkg.pri)

SOURCES = cylinderview.cpp main.cpp
HEADERS = cylinderview.h
RESOURCES = cylinder.qrc

OTHER_FILES += \
    cylinder.rc

RC_FILE = cylinder.rc

