#ifndef CAIRODART_H
#define CAIRODART_H

#include "dart_api.h"
#include "infrastructure/infrastructure.h"
#include "cairo/cairo.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

class CairoDart
{
public:
    static Dart_NativeFunction resolve(std::string& name);

    static void context_create(Dart_NativeArguments args);
    static void save(Dart_NativeArguments args);
    static void restore(Dart_NativeArguments args);
    static void push_group(Dart_NativeArguments args);
    static void push_group_with_content(Dart_NativeArguments args);
    static void pop_group_to_source(Dart_NativeArguments args);
    static void set_source_rgb(Dart_NativeArguments args);
    static void set_source_rgba(Dart_NativeArguments args);
    static void stroke(Dart_NativeArguments args);
    static void paint(Dart_NativeArguments args);

    // cairo_surface_t
    static void image_surface_create(Dart_NativeArguments args);
    static void image_surface_get_width(Dart_NativeArguments args);
    static void image_surface_get_height(Dart_NativeArguments args);
    static void image_surface_get_stride(Dart_NativeArguments args);
    static void surface_finish(Dart_NativeArguments args);
    static void surface_flush(Dart_NativeArguments args);
    static void surface_get_content(Dart_NativeArguments args);
    static void surface_mark_dirty(Dart_NativeArguments args);
    static void surface_mark_dirty_rectangle(Dart_NativeArguments args);
    static void surface_get_device_offset(Dart_NativeArguments args);
    static void surface_set_device_offset(Dart_NativeArguments args);
    static void surface_copy_page(Dart_NativeArguments args);
    static void surface_show_page(Dart_NativeArguments args);
    static void surface_supports_mime_type(Dart_NativeArguments args);
    static void surface_has_show_text_glyphs(Dart_NativeArguments args);
    static void surface_get_type(Dart_NativeArguments args);
    static void surface_get_fallback_resolution(Dart_NativeArguments args);
    static void surface_set_fallback_resolution(Dart_NativeArguments args);

    // cairo_pattern_t
    static void pattern_create_rgb(Dart_NativeArguments args);
    static void pattern_create_rgba(Dart_NativeArguments args);
    static void pattern_create_for_surface(Dart_NativeArguments args);
    static void pattern_create_linear(Dart_NativeArguments args);
    static void pattern_create_radial(Dart_NativeArguments args);
    static void pattern_create_mesh(Dart_NativeArguments args);
    static void pattern_mesh_begin_patch(Dart_NativeArguments args);
    static void pattern_mesh_end_patch(Dart_NativeArguments args);
    static void pattern_mesh_move_to(Dart_NativeArguments args);
    static void pattern_mesh_line_to(Dart_NativeArguments args);
    static void pattern_mesh_curve_to(Dart_NativeArguments args);
    static void pattern_mesh_get_control_point(Dart_NativeArguments args);
    static void pattern_mesh_set_control_point(Dart_NativeArguments args);
    static void pattern_mesh_get_corner_color(Dart_NativeArguments args);
    static void pattern_mesh_set_corner_color(Dart_NativeArguments args);
    static void pattern_mesh_get_patch_count(Dart_NativeArguments args);
    static void pattern_add_color_stop_rgb(Dart_NativeArguments args);
    static void pattern_add_color_stop_rgba(Dart_NativeArguments args);
    static void pattern_get_color_stop_count(Dart_NativeArguments args);
    static void pattern_get_color_stop_rgba(Dart_NativeArguments args);
    static void pattern_get_linear_points(Dart_NativeArguments args);
    static void pattern_get_radial_circles(Dart_NativeArguments args);
    static void pattern_set_extend(Dart_NativeArguments args);
    static void pattern_get_extend(Dart_NativeArguments args);
    static void pattern_set_filter(Dart_NativeArguments args);
    static void pattern_get_filter(Dart_NativeArguments args);
    static void pattern_get_type(Dart_NativeArguments args);
    static void pattern_get_matrix(Dart_NativeArguments args);
    static void pattern_set_matrix(Dart_NativeArguments args);


    // cairo_format_t
    static void format_stride_for_width(Dart_NativeArguments args);

    // cairo_matrix_t
    static void matrix_create(Dart_NativeArguments args);
    static void matrix_xx(Dart_NativeArguments args);
    static void matrix_yx(Dart_NativeArguments args);
    static void matrix_xy(Dart_NativeArguments args);
    static void matrix_yy(Dart_NativeArguments args);
    static void matrix_x0(Dart_NativeArguments args);
    static void matrix_y0(Dart_NativeArguments args);
    static void matrix_init(Dart_NativeArguments args);
    static void matrix_init_identity(Dart_NativeArguments args);
    static void matrix_init_translate(Dart_NativeArguments args);
    static void matrix_init_scale(Dart_NativeArguments args);
    static void matrix_init_rotate(Dart_NativeArguments args);
    static void matrix_translate(Dart_NativeArguments args);
    static void matrix_scale(Dart_NativeArguments args);
    static void matrix_rotate(Dart_NativeArguments args);
    static void matrix_invert(Dart_NativeArguments args);
    static void matrix_transform_point(Dart_NativeArguments args);
    static void matrix_transform_distance(Dart_NativeArguments args);
    static void matrix_multiply(Dart_NativeArguments args);

private:
    CairoDart();
};

} // bindings

} // cairodart

#endif // CAIRODART_H
