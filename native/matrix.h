#ifndef MATRIX_H
#define MATRIX_H

#include "dart_api.h"

#ifdef __cplusplus
extern "C" {
#endif

void matrix_destroy(void* matrix);

void matrix_create(Dart_NativeArguments args);
void matrix_xx(Dart_NativeArguments args);
void matrix_yx(Dart_NativeArguments args);
void matrix_xy(Dart_NativeArguments args);
void matrix_yy(Dart_NativeArguments args);
void matrix_x0(Dart_NativeArguments args);
void matrix_y0(Dart_NativeArguments args);
void matrix_init(Dart_NativeArguments args);
void matrix_init_identity(Dart_NativeArguments args);
void matrix_init_translate(Dart_NativeArguments args);
void matrix_init_scale(Dart_NativeArguments args);
void matrix_init_rotate(Dart_NativeArguments args);
void matrix_translate(Dart_NativeArguments args);
void matrix_scale(Dart_NativeArguments args);
void matrix_rotate(Dart_NativeArguments args);
void matrix_invert(Dart_NativeArguments args);
void matrix_transform_point(Dart_NativeArguments args);
void matrix_transform_distance(Dart_NativeArguments args);
void matrix_multiply(Dart_NativeArguments args);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // MATRIX_H
