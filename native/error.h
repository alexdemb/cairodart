#ifndef ERROR_H
#define ERROR_H

void error_check_handle(Dart_Handle handle);

void error_throw(char* error, int status);

#endif // ERROR_H
