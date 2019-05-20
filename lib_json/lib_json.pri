INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

SOURCES += \
    $$PWD/src/json_reader.cpp \
    $$PWD/src/json_tool.h \
    $$PWD/src/json_value.cpp \
    $$PWD/src/json_valueiterator.inl \
    $$PWD/src/json_writer.cpp \
    $$PWD/src/version.h.in

HEADERS += \
    $$PWD/include/json/allocator.h \
    $$PWD/include/json/assertions.h \
    $$PWD/include/json/autolink.h \
    $$PWD/include/json/config.h \
    $$PWD/include/json/features.h \
    $$PWD/include/json/forwards.h \
    $$PWD/include/json/reader.h \
    $$PWD/include/json/value.h \
    $$PWD/include/json/version.h \
    $$PWD/include/json/writer.h
