#ifndef REGION_H
#define REGION_H

#include "dart_api.h"

void region_destroy(void* handle);
void region_create(Dart_NativeArguments args);
void region_create_rectangle(Dart_NativeArguments args);
void region_create_rectangles(Dart_NativeArguments args);
void region_copy(Dart_NativeArguments args);
void region_get_extents(Dart_NativeArguments args);
void region_get_num_rectangles(Dart_NativeArguments args);
void region_get_rectangle(Dart_NativeArguments args);
void region_is_empty(Dart_NativeArguments args);
void region_contains_point(Dart_NativeArguments args);
void region_contains_rectangle(Dart_NativeArguments args);
void region_equal(Dart_NativeArguments args);
void region_translate(Dart_NativeArguments args);
void region_intersect(Dart_NativeArguments args);
void region_intersect_rectangle(Dart_NativeArguments args);
void region_subtract(Dart_NativeArguments args);
void region_subtract_rectangle(Dart_NativeArguments args);
void region_union(Dart_NativeArguments args);
void region_union_rectangle(Dart_NativeArguments args);
void region_xor(Dart_NativeArguments args);
void region_xor_rectangle(Dart_NativeArguments args);


#endif // REGION_H
