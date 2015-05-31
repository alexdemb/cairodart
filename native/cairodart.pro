include(infrastructure/infrastructure.pri)
include(bindings/bindings.pri)

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
    library.h

SOURCES += \
    argument.c \
    error.c \
    library.c \
    extension.c
