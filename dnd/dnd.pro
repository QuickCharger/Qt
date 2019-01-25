QT += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = dnd
TEMPLATE = app

# Input
HEADERS += *.h
SOURCES += *.cpp

FORMS += mainwindow.ui