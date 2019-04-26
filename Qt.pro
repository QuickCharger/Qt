#-------------------------------------------------
#
# Project created by QtCreator 2016-04-02T01:29:23
#
#-------------------------------------------------

#QT       += core gui

#greaterThan(QT_MAJOR_VERSION, 4): QT += widgets network

#TARGET = socket_qt
#TEMPLATE = app


#SOURCES += main.cpp\
#        mainwindow.cpp

#HEADERS  += mainwindow.h

#FORMS    += mainwindow.ui

#CONFIG += mobility
#MOBILITY = 

TEMPLATE     = subdirs

include($$PWD/lib_json/lib_json.pri)
include($$PWD/lib_light/lib_light.pri)
include($$PWD/lib_qrencode/lib_qrencode.pri)
include($$PWD/lib_quazip/lib_quazip.pri)

SUBDIRS += \
    dnd\
    qml\
    demo\
    light\
    music\
    uml\
