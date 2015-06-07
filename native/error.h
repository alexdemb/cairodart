#ifndef ERROR_H
#define ERROR_H

#include <cairo/cairo.h>

void error_check_handle(Dart_Handle handle);

void error_throw(char* error, int status);

void error_verify(cairo_status_t status);

#endif // ERROR_H
