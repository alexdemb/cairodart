#ifndef CAIRODART_H
#define CAIRODART_H

#include "dart_api.h"

#ifdef __cplusplus
extern "C" {
#endif

Dart_NativeFunction resolve(const char* name);

void context_create(Dart_NativeArguments args);
void save(Dart_NativeArguments args);
void restore(Dart_NativeArguments args);
void push_group(Dart_NativeArguments args);
void push_group_with_content(Dart_NativeArguments args);
void pop_group_to_source(Dart_NativeArguments args);
void pop_group(Dart_NativeArguments args);
void set_source(Dart_NativeArguments args);
void get_source(Dart_NativeArguments args);
void set_source_rgb(Dart_NativeArguments args);
void set_source_rgba(Dart_NativeArguments args);
void stroke(Dart_NativeArguments args);
void stroke_preserve(Dart_NativeArguments args);
void in_stroke(Dart_NativeArguments args);
void stroke_extents(Dart_NativeArguments args);
void paint(Dart_NativeArguments args);
void set_line_cap(Dart_NativeArguments args);
void get_line_cap(Dart_NativeArguments args);
void set_line_join(Dart_NativeArguments args);
void get_line_join(Dart_NativeArguments args);
void set_line_width(Dart_NativeArguments args);
void get_line_width(Dart_NativeArguments args);
void set_miter_limit(Dart_NativeArguments args);
void get_miter_limit(Dart_NativeArguments args);
void set_operator(Dart_NativeArguments args);
void get_operator(Dart_NativeArguments args);
void set_fill_rule(Dart_NativeArguments args);
void get_fill_rule(Dart_NativeArguments args);
void has_current_point(Dart_NativeArguments args);
void move_to(Dart_NativeArguments args);
void line_to(Dart_NativeArguments args);
void rectangle(Dart_NativeArguments args);
void get_current_point(Dart_NativeArguments args);
void new_path(Dart_NativeArguments args);
void new_sub_path(Dart_NativeArguments args);
void close_path(Dart_NativeArguments args);
void arc(Dart_NativeArguments args);
void arc_negative(Dart_NativeArguments args);
void curve_to(Dart_NativeArguments args);
void rel_move_to(Dart_NativeArguments args);
void rel_line_to(Dart_NativeArguments args);
void rel_curve_to(Dart_NativeArguments args);
void text_path(Dart_NativeArguments args);
void path_extents(Dart_NativeArguments args);
void get_antialias(Dart_NativeArguments args);
void set_antialias(Dart_NativeArguments args);
void get_tolerance(Dart_NativeArguments args);
void set_tolerance(Dart_NativeArguments args);
void clip(Dart_NativeArguments args);
void clip_preserve(Dart_NativeArguments args);
void in_clip(Dart_NativeArguments args);
void reset_clip(Dart_NativeArguments args);
void clip_extents(Dart_NativeArguments args);
void fill(Dart_NativeArguments args);
void fill_preserve(Dart_NativeArguments args);
void fill_extents(Dart_NativeArguments args);
void in_fill(Dart_NativeArguments args);
void copy_clip_rectangle_list(Dart_NativeArguments args);
void rectangle_list_destroy(Dart_NativeArguments args);
void mask(Dart_NativeArguments args);
void mask_surface(Dart_NativeArguments args);
void paint_with_alpha(Dart_NativeArguments args);
void show_page(Dart_NativeArguments args);
void copy_page(Dart_NativeArguments args);
void set_dash(Dart_NativeArguments args);
void get_dash(Dart_NativeArguments args);
void get_dash_count(Dart_NativeArguments args);
void set_source_surface(Dart_NativeArguments args);
void get_group_target(Dart_NativeArguments args);

// cairo_surface_t
void image_surface_create(Dart_NativeArguments args);
void image_surface_get_width(Dart_NativeArguments args);
void image_surface_get_height(Dart_NativeArguments args);
void image_surface_get_stride(Dart_NativeArguments args);
void surface_finish(Dart_NativeArguments args);
void surface_flush(Dart_NativeArguments args);
void surface_get_content(Dart_NativeArguments args);
void surface_mark_dirty(Dart_NativeArguments args);
void surface_mark_dirty_rectangle(Dart_NativeArguments args);
void surface_get_device_offset(Dart_NativeArguments args);
void surface_set_device_offset(Dart_NativeArguments args);
void surface_copy_page(Dart_NativeArguments args);
void surface_show_page(Dart_NativeArguments args);
void surface_supports_mime_type(Dart_NativeArguments args);
void surface_has_show_text_glyphs(Dart_NativeArguments args);
void surface_get_type(Dart_NativeArguments args);
void surface_get_fallback_resolution(Dart_NativeArguments args);
void surface_set_fallback_resolution(Dart_NativeArguments args);
void image_surface_create_from_png(Dart_NativeArguments args);
void surface_write_to_png(Dart_NativeArguments args);
void surfaces_equals(Dart_NativeArguments args);

// cairo_pattern_t
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

// cairo_format_t
void format_stride_for_width(Dart_NativeArguments args);

// cairo_region_t
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

#ifdef __cplusplus
} // extern "C"
#endif


#endif // CAIRODART_H
