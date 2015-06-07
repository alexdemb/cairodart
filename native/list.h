#ifndef LIST_H
#define LIST_H

#include "dart_api.h"

Dart_Handle list_at(Dart_Handle list, int idx);

int list_length(Dart_Handle list);

int list_int_at(Dart_Handle list, int idx);

double list_double_at(Dart_Handle list, int idx);


#endif // LIST_H
