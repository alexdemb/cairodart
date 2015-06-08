#ifndef FONT_OPTIONS_H
#define FONT_OPTIONS_H

#include "dart_api.h"

void font_options_destroy(void* handle);
void font_options_create(Dart_NativeArguments args);
void font_options_copy(Dart_NativeArguments args);
void font_options_merge(Dart_NativeArguments args);
void font_options_hash(Dart_NativeArguments args);
void font_options_equal(Dart_NativeArguments args);
void font_options_set_antialias(Dart_NativeArguments args);
void font_options_get_antialias(Dart_NativeArguments args);
void font_options_set_subpixel_order(Dart_NativeArguments args);
void font_options_get_subpixel_order(Dart_NativeArguments args);
void font_options_set_hint_style(Dart_NativeArguments args);
void font_options_get_hint_style(Dart_NativeArguments args);
void font_options_set_hint_metrics(Dart_NativeArguments args);
void font_options_get_hint_metrics(Dart_NativeArguments args);

#endif // FONT_OPTIONS_H
