#ifndef SCALED_FONT_H
#define SCALED_FONT_H

#include "dart_api.h"

void scaled_font_destroy(void* handle);
void scaled_font_create(Dart_NativeArguments args);
void scaled_font_extents(Dart_NativeArguments args);
void scaled_font_text_extents(Dart_NativeArguments args);
void scaled_font_glyph_extents(Dart_NativeArguments args);
void scaled_font_text_to_glyphs(Dart_NativeArguments args);
void scaled_font_get_font_face(Dart_NativeArguments args);
void scaled_font_get_font_options(Dart_NativeArguments args);
void scaled_font_get_font_matrix(Dart_NativeArguments args);
void scaled_font_get_ctm(Dart_NativeArguments args);
void scaled_font_get_scale_matrix(Dart_NativeArguments args);
void scaled_font_get_type(Dart_NativeArguments args);

#endif // SCALED_FONT_H
