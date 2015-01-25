include(infrastructure/infrastructure.pri)
include(bindings/bindings.pri)

DART_API_INCLUDE = "$$(DART_SDK)/include"

message(Dart SDK is: $$DART_API_INCLUDE)

INCLUDEPATH += $$DART_API_INCLUDE

