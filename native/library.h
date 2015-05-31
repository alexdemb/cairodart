#ifndef LIBRARY_H
#define LIBRARY_H

#include "dart_api.h"

#ifdef __cplusplus
extern "C" {
#endif

Dart_Handle library_get();
void library_set(Dart_Handle library);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // LIBRARY_H
