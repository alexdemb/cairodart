#ifndef FACTORY_H
#define FACTORY_H

#include "dart_api.h"

#ifdef __cplusplus
extern "C" {
#endif

Dart_Handle factory_create_object(const char* className, const char* ctorName, Dart_Handle* args, int argc);

Dart_Handle factory_create_point(const double x, const double y);

Dart_Handle factory_create_distance(const double dx, const double dy);

Dart_Handle factory_create_rectangle(const int x, const int y, const int width, const int height);

Dart_Handle factory_create_resolution(const double xRes, const double yRes);

Dart_Handle factory_create_color(const double red, const double green, const double blue, const double alpha);

Dart_Handle factory_create_color_stop(Dart_Handle color, double offset);

Dart_Handle factory_create_circle(const double x, const double y, const double radius);

Dart_Handle factory_create_matrix();

#ifdef __cplusplus
} // extern "C"
#endif

#endif // FACTORY_H
