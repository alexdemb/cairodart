#ifndef LIST_H
#define LIST_H

#include "dart_api.h"

#ifdef __cplusplus
extern "C" {
#endif

int list_length(Dart_Handle list);

int list_int_at(Dart_Handle list, int idx);


#ifdef __cplusplus
} // extern "C"
#endif

#endif // LIST_H
