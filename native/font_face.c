#include <cairo/cairo.h>
#include "dart_api.h"
#include "font_face.h"
#include "argument.h"
#include "bind.h"
#include "factory.h"

void font_face_destroy(void* handle) {
    if (handle) {
        cairo_font_face_t* fontFace = (cairo_font_face_t*) handle;
        unsigned int refCount = cairo_font_face_get_reference_count(fontFace);
        if (fontFace && refCount == 1) {
            cairo_font_face_destroy(fontFace);
        }
    }
}


void font_face_get_type(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_face_t* fontFace = bind_get_self(args);

    cairo_font_type_t fontType = cairo_font_face_get_type(fontFace);

    Dart_Handle res = factory_create_font_type(fontType);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}


void font_face_status(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_face_t* fontFace = bind_get_self(args);

    cairo_status_t status = cairo_font_face_status(fontFace);

    Dart_Handle ret = factory_create_status(status);

    Dart_SetReturnValue(args, ret);
    Dart_ExitScope();
}
