#ifndef FONT_FACE_H
#define FONT_FACE_H

#include "dart_api.h"

void font_face_destroy(void* handle);
void font_face_get_type(Dart_NativeArguments args);
void font_face_status(Dart_NativeArguments args);

#endif // FONT_FACE_H
