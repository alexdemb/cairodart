#include <stdlib.h>
#include <string.h>
#include "dart_api.h"

#include "library.h"
#include "argument.h"
#include "error.h"

#include "context.h"
#include "surface.h"
#include "pattern.h"
#include "matrix.h"
#include "region.h"
#include "format.h"
#include "font_face.h"
#include "font_options.h"
#include "scaled_font.h"

Dart_NativeFunction resolve(const char* name);
Dart_NativeFunction ResolveName(Dart_Handle name, int argc, bool* auto_setup_scope);

DART_EXPORT Dart_Handle cairodart_Init(Dart_Handle parent_library) {
    if (Dart_IsError(parent_library))
        return parent_library;

    Dart_Handle result_code = Dart_SetNativeResolver(parent_library, ResolveName, NULL);
    if (Dart_IsError(result_code))
        return result_code;

    Dart_Handle lib = Dart_NewPersistentHandle(parent_library);
    library_set(lib);
    return Dart_Null();
}

Dart_NativeFunction ResolveName(Dart_Handle name, int argc, bool* auto_setup_scope) {
    UNUSED(argc)
    UNUSED(auto_setup_scope)

    if (!Dart_IsString(name))
        return NULL;

    Dart_NativeFunction result = NULL;

    const char* funcName;
    error_check_handle(Dart_StringToCString(name, &funcName));

    result = resolve(funcName);
    return result;
}

struct _DartFunctionMap {
    const char* name;
    Dart_NativeFunction fun;
};

typedef struct _DartFunctionMap DartFunctionMap;

static DartFunctionMap FUNCTIONS_MAP[] = {
  { "context_create", context_create },
  { "save", save },
  { "restore", restore },
  { "push_group", push_group },
  { "push_group_with_content", push_group_with_content },
  { "pop_group_to_source", pop_group_to_source },
  { "pop_group", pop_group },
  { "set_source", set_source },
  { "get_source", get_source },
  { "set_source_rgb", set_source_rgb },
  { "set_source_rgba", set_source_rgba },
  { "stroke", stroke },
  { "stroke_preserve", stroke_preserve },
  { "in_stroke", in_stroke },
  { "stroke_extents", stroke_extents },
  { "paint", paint },
  { "set_line_cap", set_line_cap },
  { "get_line_cap", get_line_cap },
  { "set_line_join", set_line_join },
  { "get_line_join", get_line_join },
  { "set_line_width", set_line_width },
  { "get_line_width", get_line_width },
  { "set_miter_limit", set_miter_limit },
  { "get_miter_limit", get_miter_limit },
  { "set_operator", set_operator },
  { "get_operator", get_operator },
  { "set_fill_rule", set_fill_rule },
  { "get_fill_rule", get_fill_rule },
  { "has_current_point", has_current_point },
  { "move_to", move_to },
  { "line_to", line_to },
  { "rectangle", rectangle },
  { "get_current_point", get_current_point },
  { "new_path", new_path },
  { "new_sub_path", new_sub_path },
  { "close_path", close_path },
  { "arc", arc },
  { "arc_negative", arc_negative },
  { "curve_to", curve_to },
  { "rel_curve_to", rel_curve_to },
  { "rel_line_to", rel_line_to },
  { "rel_move_to", rel_move_to },
  { "text_path", text_path },
  { "path_extents", path_extents },
  { "get_antialias", get_antialias },
  { "set_antialias", set_antialias },
  { "get_tolerance", get_tolerance },
  { "set_tolerance", set_tolerance },
  { "clip", clip },
  { "clip_preserve", clip_preserve },
  { "in_clip", in_clip },
  { "reset_clip", reset_clip },
  { "clip_extents", clip_extents },
  { "fill", fill },
  { "fill_preserve", fill_preserve },
  { "fill_extents", fill_extents },
  { "in_fill", in_fill },
  { "copy_clip_rectangle_list", copy_clip_rectangle_list },
  { "rectangle_list_destroy", rectangle_list_destroy },
  { "mask", mask },
  { "mask_surface", mask_surface },
  { "paint_with_alpha", paint_with_alpha },
  { "show_page", show_page },
  { "copy_page", copy_page },
  { "get_dash", get_dash },
  { "set_dash", set_dash },
  { "get_dash_count", get_dash_count },
  { "set_source_surface", set_source_surface },
  { "get_group_target", get_group_target },
  { "image_surface_create", image_surface_create },
  { "image_surface_get_width", image_surface_get_width },
  { "image_surface_get_height", image_surface_get_height },
  { "format_stride_for_width", format_stride_for_width },
  { "image_surface_get_stride", image_surface_get_stride },
  { "surface_finish", surface_finish },
  { "surface_flush", surface_flush },
  { "surface_get_content", surface_get_content },
  { "surface_mark_dirty", surface_mark_dirty },
  { "surface_mark_dirty_rectangle", surface_mark_dirty_rectangle },
  { "surface_get_device_offset", surface_get_device_offset },
  { "surface_set_device_offset", surface_set_device_offset },
  { "surface_copy_page", surface_copy_page },
  { "surface_show_page", surface_show_page },
  { "surface_has_show_text_glyphs", surface_has_show_text_glyphs },
  { "surface_supports_mime_type", surface_supports_mime_type },
  { "surface_get_type", surface_get_type },
  { "surface_get_fallback_resolution", surface_get_fallback_resolution },
  { "surface_set_fallback_resolution", surface_set_fallback_resolution },
  { "surfaces_equals", surfaces_equals },
  { "image_surface_create_from_png", image_surface_create_from_png },
  { "surface_write_to_png", surface_write_to_png },
  { "pattern_create_rgb", pattern_create_rgb },
  { "pattern_create_rgba", pattern_create_rgba },
  { "pattern_create_for_surface", pattern_create_for_surface },
  { "pattern_create_linear", pattern_create_linear },
  { "pattern_create_radial", pattern_create_radial },
  { "pattern_create_mesh", pattern_create_mesh },
  { "pattern_mesh_begin_patch", pattern_mesh_begin_patch },
  { "pattern_mesh_end_patch", pattern_mesh_end_patch },
  { "pattern_mesh_move_to", pattern_mesh_move_to },
  { "pattern_mesh_line_to", pattern_mesh_line_to },
  { "pattern_mesh_curve_to", pattern_mesh_curve_to },
  { "pattern_mesh_get_control_point", pattern_mesh_get_control_point },
  { "pattern_mesh_set_control_point", pattern_mesh_set_control_point },
  { "pattern_mesh_get_corner_color", pattern_mesh_get_corner_color },
  { "pattern_mesh_set_corner_color", pattern_mesh_set_corner_color },
  { "pattern_mesh_get_patch_count", pattern_mesh_get_patch_count },
  { "pattern_add_color_stop_rgb", pattern_add_color_stop_rgb },
  { "pattern_add_color_stop_rgba", pattern_add_color_stop_rgba },
  { "pattern_get_color_stop_count", pattern_get_color_stop_count },
  { "pattern_get_color_stop_rgba", pattern_get_color_stop_rgba },
  { "pattern_get_linear_points", pattern_get_linear_points },
  { "pattern_get_radial_circles", pattern_get_radial_circles },
  { "pattern_get_extend", pattern_get_extend },
  { "pattern_set_extend", pattern_set_extend },
  { "pattern_get_filter", pattern_get_filter },
  { "pattern_set_filter", pattern_set_filter },
  { "pattern_get_type", pattern_get_type },
  { "pattern_get_matrix", pattern_get_matrix },
  { "pattern_set_matrix", pattern_set_matrix },
  { "pattern_equals", pattern_equals },
  { "matrix_create", matrix_create },
  { "matrix_xx", matrix_xx },
  { "matrix_yx", matrix_yx },
  { "matrix_xy", matrix_xy },
  { "matrix_yy", matrix_yy },
  { "matrix_x0", matrix_x0 },
  { "matrix_y0", matrix_y0 },
  { "matrix_init", matrix_init },
  { "matrix_init_identity", matrix_init_identity },
  { "matrix_init_translate", matrix_init_translate },
  { "matrix_init_scale", matrix_init_scale },
  { "matrix_init_rotate", matrix_init_rotate },
  { "matrix_translate", matrix_translate },
  { "matrix_scale", matrix_scale },
  { "matrix_rotate", matrix_rotate },
  { "matrix_invert", matrix_invert },
  { "matrix_transform_point", matrix_transform_point },
  { "matrix_transform_distance", matrix_transform_distance },
  { "matrix_multiply", matrix_multiply },
  { "region_create", region_create },
  { "region_create_rectangle", region_create_rectangle },
  { "region_create_rectangles", region_create_rectangles },
  { "region_copy", region_copy },
  { "region_get_extents", region_get_extents },
  { "region_get_num_rectangles", region_get_num_rectangles },
  { "region_get_rectangle", region_get_rectangle },
  { "region_is_empty", region_is_empty },
  { "region_contains_point", region_contains_point },
  { "region_contains_rectangle", region_contains_rectangle },
  { "region_equal", region_equal },
  { "region_translate", region_translate },
  { "region_intersect", region_intersect },
  { "region_intersect_rectangle", region_intersect_rectangle },
  { "region_subtract", region_subtract },
  { "region_subtract_rectangle", region_subtract_rectangle },
  { "region_union", region_union },
  { "region_union_rectangle", region_union_rectangle },
  { "region_xor", region_xor },
  { "region_xor_rectangle", region_xor_rectangle },
  { "font_face_get_type", font_face_get_type },
  { "font_options_create", font_options_create },
  { "font_options_copy", font_options_copy },
  { "font_options_merge", font_options_merge },
  { "font_options_hash", font_options_hash },
  { "font_options_equal", font_options_equal },
  { "font_options_set_antialias", font_options_set_antialias },
  { "font_options_get_antialias", font_options_get_antialias },
  { "font_options_set_subpixel_order", font_options_set_subpixel_order },
  { "font_options_get_subpixel_order", font_options_get_subpixel_order },
  { "font_options_set_hint_style", font_options_set_hint_style },
  { "font_options_get_hint_style", font_options_get_hint_style },
  { "font_options_set_hint_metrics", font_options_set_hint_metrics },
  { "font_options_get_hint_metrics", font_options_get_hint_metrics },
  { "scaled_font_create", scaled_font_create },
  { "scaled_font_extents", scaled_font_extents },
  { "scaled_font_text_extents", scaled_font_text_extents },
  { "scaled_font_glyph_extents", scaled_font_glyph_extents },
  { "scaled_font_get_font_face", scaled_font_get_font_face },
  { "scaled_font_get_font_options", scaled_font_get_font_options },
  { "scaled_font_get_font_matrix", scaled_font_get_font_matrix },
  { "scaled_font_get_ctm", scaled_font_get_ctm },
  { "scaled_font_get_scale_matrix", scaled_font_get_scale_matrix },
  { "scaled_font_get_type", scaled_font_get_type },
};

Dart_NativeFunction resolve(const char* name) {
    const int SIZE = sizeof(FUNCTIONS_MAP) / sizeof(DartFunctionMap);
    int i = 0;
    for (i = 0; i < SIZE; i++) {
        if (strcmp(name, FUNCTIONS_MAP[i].name) == 0)
            return FUNCTIONS_MAP[i].fun;
    }
    return NULL;
}


