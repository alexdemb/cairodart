#ifndef FACTORY_H
#define FACTORY_H

#include "dart_api.h"

#ifdef __cplusplus
extern "C" {
#endif

Dart_Handle factory_create_object(const char* className, const char* ctorName, Dart_Handle* args, int argc);

Dart_Handle factory_create_point(const double x, const double y);

Dart_Handle factory_create_distance(const double dx, const double dy);


#ifdef __cplusplus
} // extern "C"
#endif

#endif // FACTORY_H
