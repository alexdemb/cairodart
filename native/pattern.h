#ifndef PATTERN_H
#define PATTERN_H

#include "dart_api.h"

void pattern_destroy(void* handle);
void pattern_create_rgb(Dart_NativeArguments args);
void pattern_create_rgba(Dart_NativeArguments args);
void pattern_create_for_surface(Dart_NativeArguments args);
void pattern_create_linear(Dart_NativeArguments args);
void pattern_create_radial(Dart_NativeArguments args);
void pattern_create_mesh(Dart_NativeArguments args);
void pattern_mesh_begin_patch(Dart_NativeArguments args);
void pattern_mesh_end_patch(Dart_NativeArguments args);
void pattern_mesh_move_to(Dart_NativeArguments args);
void pattern_mesh_line_to(Dart_NativeArguments args);
void pattern_mesh_curve_to(Dart_NativeArguments args);
void pattern_mesh_get_control_point(Dart_NativeArguments args);
void pattern_mesh_set_control_point(Dart_NativeArguments args);
void pattern_mesh_get_corner_color(Dart_NativeArguments args);
void pattern_mesh_set_corner_color(Dart_NativeArguments args);
void pattern_mesh_get_patch_count(Dart_NativeArguments args);
void pattern_add_color_stop_rgb(Dart_NativeArguments args);
void pattern_add_color_stop_rgba(Dart_NativeArguments args);
void pattern_get_color_stop_count(Dart_NativeArguments args);
void pattern_get_color_stop_rgba(Dart_NativeArguments args);
void pattern_get_linear_points(Dart_NativeArguments args);
void pattern_get_radial_circles(Dart_NativeArguments args);
void pattern_set_extend(Dart_NativeArguments args);
void pattern_get_extend(Dart_NativeArguments args);
void pattern_set_filter(Dart_NativeArguments args);
void pattern_get_filter(Dart_NativeArguments args);
void pattern_get_type(Dart_NativeArguments args);
void pattern_get_matrix(Dart_NativeArguments args);
void pattern_set_matrix(Dart_NativeArguments args);
void pattern_equals(Dart_NativeArguments args);


#endif // PATTERN_H
