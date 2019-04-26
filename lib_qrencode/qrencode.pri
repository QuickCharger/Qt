INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

SOURCES += libqrencode/bitstream.c \
	libqrencode/mask.c \
	libqrencode/mmask.c \
	libqrencode/mqrspec.c \
	libqrencode/qrencode.c \
	libqrencode/qrinput.c \
	libqrencode/qrspec.c \
	libqrencode/rsecc.c\
	libqrencode/split.c



HEADERS  += libqrencode/bitstream.h \
	libqrencode/config.h \
	libqrencode/mask.h \
	libqrencode/mmask.h \
	libqrencode/mqrspec.h \
	libqrencode/qrencode.h \
	libqrencode/qrencode_inner.h \
	libqrencode/qrinput.h \
	libqrencode/qrspec.h \
	libqrencode/rsecc.h \
	libqrencode/split.h
