#ifndef DEVICE_H
#define DEVICE_H

#include "dart_api.h"

void device_destroy(void* handle);
void device_finish(Dart_NativeArguments args);
void device_flush(Dart_NativeArguments args);
void device_acquire(Dart_NativeArguments args);
void device_release(Dart_NativeArguments args);
void device_get_type(Dart_NativeArguments args);
void device_status(Dart_NativeArguments args);
void script_create(Dart_NativeArguments args);

#endif // DEVICE_H
