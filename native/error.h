#ifndef ERROR_H
#define ERROR_H

#include <cairo/cairo.h>

#ifdef __cplusplus
extern "C" {
#endif

void error_check_handle(Dart_Handle handle);

void error_throw(char* error, int status);

void error_verify(cairo_status_t status);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // ERROR_H
