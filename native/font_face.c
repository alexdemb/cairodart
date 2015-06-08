#include <cairo/cairo.h>
#include "dart_api.h"
#include "font_face.h"
#include "argument.h"
#include "bind.h"
#include "factory.h"

void font_face_get_type(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_face_t* fontFace = bind_get_self(args);

    cairo_font_type_t fontType = cairo_font_face_get_type(fontFace);

    Dart_Handle res = factory_create_font_type(fontType);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}
