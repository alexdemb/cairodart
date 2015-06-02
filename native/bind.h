#ifndef BIND_H
#define BIND_H

#include "dart_api.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef void(*DestroyFunc)(void*);

void bind_setup(void* obj, Dart_Handle handle, DestroyFunc destroy_func);

void* bind_get(Dart_Handle handle);

void* bind_get_self(Dart_NativeArguments args);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // BIND_H
