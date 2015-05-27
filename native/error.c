#include "library.h"
#include "error.h"
#include "dart_api.h"

#define CAIRO_EXCEPTION "CairoException"

void error_check_handle(Dart_Handle handle) {
   if (Dart_IsError(handle)) {
      Dart_PropagateError(handle);
   }
}

void error_throw(char *error, int status) {
   Dart_Handle constructorName = Dart_Null();
   Dart_Handle clazz = Dart_NewStringFromCString(CAIRO_EXCEPTION);
   Dart_Handle type = Dart_GetClass(library_get(), clazz);
   error_check_handle(type);

   Dart_Handle args[2];
   args[0] = Dart_NewStringFromCString(error);
   args[1] = Dart_NewInteger(status);

   Dart_Handle obj = Dart_New(type, constructorName, 2, args);
   error_check_handle(obj);
   Dart_ThrowException(obj);
}
