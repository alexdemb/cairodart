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


Dart_Handle factory_create_rectangle(const int x, const int y, const int width, const int height) {
    Dart_Handle parameters[4] =
    {
        Dart_NewDouble(x),
        Dart_NewDouble(y),
        Dart_NewDouble(width),
        Dart_NewDouble(height)
    };
    return factory_create_object("Rectangle", "", parameters, 4);
}

Dart_Handle factory_create_resolution(const double xRes, const double yRes) {
    Dart_Handle resArgs[2] = { Dart_NewDouble(xRes), Dart_NewDouble(yRes) };
    return factory_create_object("Resolution", "", resArgs, 2);
}

Dart_Handle factory_create_color(const double red, const double green, const double blue, const double alpha) {
    Dart_Handle colorArgs[4] =
    {
        Dart_NewDouble(red),
        Dart_NewDouble(green),
        Dart_NewDouble(blue),
        Dart_NewDouble(alpha)
    };
    return factory_create_object("Color", "rgba", colorArgs, 4);
}

Dart_Handle factory_create_color_stop(Dart_Handle color, double offset) {
    Dart_Handle colorStopArgs[2] = { color, Dart_NewDouble(offset) };
    return factory_create_object("ColorStop", "", colorStopArgs, 2);
}

Dart_Handle factory_create_circle(const double x, const double y, const double radius) {
    Dart_Handle args[3] = { Dart_NewDouble(x), Dart_NewDouble(y), Dart_NewDouble(radius) };
    return factory_create_object("Circle", "", args, 3);
}

Dart_Handle factory_create_matrix() {
    return factory_create_object("_Matrix", "internal", NULL, 0);
}
