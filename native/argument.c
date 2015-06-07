#include <stdint.h>
#include "argument.h"
#include "error.h"


Dart_Handle arg_get(Dart_NativeArguments* args, int index) {
   Dart_Handle arg = Dart_GetNativeArgument(*args, index);
   error_check_handle(arg);
   return arg;
}

int arg_get_int(Dart_NativeArguments* args, int index) {
   int64_t val;
   Dart_Handle arg = arg_get(args, index);

   if (!Dart_IsInteger(arg))
      error_throw("Parameter is not a valid integer", -1);


   error_check_handle(Dart_IntegerToInt64(arg, &val));
   return val;
}

double arg_get_double(Dart_NativeArguments* args, int index) {
   double val;
   Dart_Handle arg = arg_get(args, index);

   if (!Dart_IsDouble(arg))
      error_throw("Parameter is not a valid double", -1);


   error_check_handle(Dart_DoubleValue(arg, &val));
   return val;
}

bool arg_get_bool(Dart_NativeArguments* args, int index) {
   bool val;
   Dart_Handle arg = arg_get(args, index);

   if (!Dart_IsBoolean(arg))
      error_throw("Parameter is not a valid boolean", -1);

   error_check_handle(Dart_BooleanValue(arg, &val));
   return val;
}

const char* arg_get_string(Dart_NativeArguments* args, int index) {
   const char* val;
   Dart_Handle arg = arg_get(args, index);

   if (!Dart_IsString(arg))
      error_throw("Parameter is not a valid string", -1);

   error_check_handle(Dart_StringToCString(arg, &val));
   return val;
}
