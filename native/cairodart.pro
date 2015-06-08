DART_API_INCLUDE = "$$(DART_SDK)/include"

INCLUDEPATH += $$DART_API_INCLUDE

TEMPLATE = lib
VERSION = 0.1
TARGET = cairodart
CONFIG += shared
CONFIG += c++11
CONFIG -= qt
LIBS += -lcairo
DESTDIR += "$$PWD/../cairodart/lib/src"

HEADERS += \
    argument.h \
    error.h \
    library.h \
    bind.h \
    matrix.h \
    factory.h \
    list.h \
    region.h \
    surface.h \
    pattern.h \
    context.h \
    format.h \
    font_face.h

SOURCES += \
    argument.c \
    error.c \
    library.c \
    extension.c \
    bind.c \
    matrix.c \
    factory.c \
    list.c \
    region.c \
    surface.c \
    pattern.c \
    context.c \
    format.c \
    font_face.c
