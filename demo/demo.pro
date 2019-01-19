QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets network

TARGET = client
TEMPLATE = app

SOURCES += main.cpp \
    cbuildindlg.cpp

HEADERS  += \
    cbuildindlg.h
