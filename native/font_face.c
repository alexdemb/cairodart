#include <cairo/cairo.h>
#include "dart_api.h"
#include "font_face.h"
#include "argument.h"
#include "bind.h"
#include "factory.h"

void font_face_destroy(void* handle) {
    if (handle) {
        cairo_font_face_t* fontFace = (cairo_font_face_t*) handle;
        if (fontFace) {
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

void toy_font_face_create(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);
    const char* family = arg_get_string(&args, 1);
    cairo_font_slant_t slant = (cairo_font_slant_t) arg_get_int(&args, 2);
    cairo_font_weight_t weight = (cairo_font_weight_t) arg_get_int(&args, 3);

    cairo_font_face_t* fontFace = cairo_toy_font_face_create(family, slant, weight);

    bind_setup(fontFace, obj, font_face_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void toy_font_face_get_family(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_face_t* fontFace = bind_get_self(args);

    const char* family = cairo_toy_font_face_get_family(fontFace);

    Dart_SetReturnValue(args, Dart_NewStringFromCString(family));
    Dart_ExitScope();
}

void toy_font_face_get_slant(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_face_t* fontFace = bind_get_self(args);

    cairo_font_slant_t slant = cairo_toy_font_face_get_slant(fontFace);

    Dart_Handle slantObj = factory_create_font_slant(slant);

    Dart_SetReturnValue(args, slantObj);
    Dart_ExitScope();
}


void toy_font_face_get_weight(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_face_t* fontFace = bind_get_self(args);

    cairo_font_weight_t weight = cairo_toy_font_face_get_weight(fontFace);

    Dart_Handle weightObj = factory_create_font_weight(weight);

    Dart_SetReturnValue(args, weightObj);
    Dart_ExitScope();
}
