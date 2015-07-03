#ifndef SURFACE_H
#define SURFACE_H

#include "dart_api.h"

void surface_destroy(void* handle);
void image_surface_create(Dart_NativeArguments args);
void image_surface_create_for_data(Dart_NativeArguments args);
void image_surface_get_width(Dart_NativeArguments args);
void image_surface_get_height(Dart_NativeArguments args);
void image_surface_get_stride(Dart_NativeArguments args);
void image_surface_get_data(Dart_NativeArguments args);
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
void surface_get_device(Dart_NativeArguments args);
void script_surface_create(Dart_NativeArguments args);
void script_surface_create_for_target(Dart_NativeArguments args);
void image_surface_create_from_png(Dart_NativeArguments args);
void surface_write_to_png(Dart_NativeArguments args);
void pdf_surface_create(Dart_NativeArguments args);
void pdf_surface_set_size(Dart_NativeArguments args);
void pdf_version_to_string(Dart_NativeArguments args);
void pdf_surface_restrict_to_version(Dart_NativeArguments args);
void pdf_surface_get_versions(Dart_NativeArguments args);
void ps_surface_create(Dart_NativeArguments args);
void ps_level_to_string(Dart_NativeArguments args);
void ps_surface_set_eps(Dart_NativeArguments args);
void ps_surface_get_eps(Dart_NativeArguments args);
void ps_surface_restrict_to_level(Dart_NativeArguments args);
void ps_get_levels(Dart_NativeArguments args);
void ps_surface_set_size(Dart_NativeArguments args);
void ps_surface_dsc_begin_setup(Dart_NativeArguments args);
void ps_surface_dsc_begin_page_setup(Dart_NativeArguments args);
void ps_surface_dsc_comment(Dart_NativeArguments args);
void svg_surface_create(Dart_NativeArguments args);
void svg_version_to_string(Dart_NativeArguments args);
void svg_surface_restrict_to_version(Dart_NativeArguments args);
void svg_get_versions(Dart_NativeArguments args);
void recording_surface_create(Dart_NativeArguments args);
void recording_surface_ink_extents(Dart_NativeArguments args);
void recording_surface_get_extents(Dart_NativeArguments args);
void surfaces_equals(Dart_NativeArguments args);


#endif // SURFACE_H
