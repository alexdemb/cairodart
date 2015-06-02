#include <stdlib.h>

#include "factory.h"
#include "error.h"
#include "library.h"

Dart_Handle factory_create_object(const char* className, const char* ctorName, Dart_Handle* args, int argc) {
    Dart_Handle constructorName = ctorName == NULL ? Dart_Null() : Dart_NewStringFromCString(ctorName);
    Dart_Handle clazz = Dart_NewStringFromCString(className);
    Dart_Handle type = Dart_GetClass(library_get(), clazz);
    error_check_handle(type);
    Dart_Handle obj = Dart_New(type, constructorName, argc, args);
    error_check_handle(obj);
    return obj;
}

Dart_Handle factory_create_point(const double x, const double y) {
    Dart_Handle args[] = { Dart_NewDouble(x), Dart_NewDouble(y) };
    return factory_create_object("Point", "from", args, 2);
}

Dart_Handle factory_create_distance(const double dx, const double dy) {
    Dart_Handle args[] = { Dart_NewDouble(dx), Dart_NewDouble(dy) };
    return factory_create_object("Distance", "from", args, 2);
}
