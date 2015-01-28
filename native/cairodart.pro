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
DESTDIR += "$$PWD/../cairodart/lib/src"
