#ifndef ARGUMENT_H
#define ARGUMENT_H

#include "dart_api.h"

#define UNUSED(expr) (void)(expr);;

Dart_Handle arg_get(Dart_NativeArguments* args, int index);

int arg_get_int(Dart_NativeArguments* args, int index);

double arg_get_double(Dart_NativeArguments* args, int index);

bool arg_get_bool(Dart_NativeArguments* args, int index);

const char* arg_get_string(Dart_NativeArguments* args, int index);

#endif // ARGUMENT_H
