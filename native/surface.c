#include <stdlib.h>
#include <cairo/cairo.h>

#include "argument.h"
#include "error.h"
#include "bind.h"
#include "factory.h"
#include "surface.h"


void surface_destroy(void* handle) {
    if (handle) {
        cairo_surface_t* surface = (cairo_surface_t*) handle;
        unsigned int refCount = cairo_surface_get_reference_count(surface);
        if (surface && refCount > 0) {
            cairo_surface_destroy(surface);
            surface = NULL;
        }

    }
}

void image_surface_create(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);
    cairo_format_t format = (cairo_format_t)arg_get_int(&args, 1);
    int64_t width = arg_get_int(&args, 2);
    int64_t height = arg_get_int(&args, 3);

    cairo_surface_t* surface = cairo_image_surface_create(format, width, height);

    bind_setup(surface, obj, surface_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void image_surface_get_width(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);

    int width = cairo_image_surface_get_width(surface);

    Dart_SetReturnValue(args, Dart_NewInteger(width));
    Dart_ExitScope();
}

void image_surface_get_height(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);

    int height = cairo_image_surface_get_height(surface);

    Dart_SetReturnValue(args, Dart_NewInteger(height));
    Dart_ExitScope();
}

void image_surface_get_stride(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);

    int stride = cairo_image_surface_get_stride(surface);

    Dart_SetReturnValue(args, Dart_NewInteger(stride));
    Dart_ExitScope();
}

void surface_finish(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);

    cairo_surface_finish(surface);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void surface_flush(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);

    cairo_surface_flush(surface);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void surface_get_content(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);

    int content = (int)cairo_surface_get_content(surface);

    Dart_SetReturnValue(args, Dart_NewInteger(content));
    Dart_ExitScope();
}

void surface_mark_dirty(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);

    cairo_surface_mark_dirty(surface);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void surface_mark_dirty_rectangle(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);
    int x = arg_get_int(&args, 1);
    int y = arg_get_int(&args, 2);
    int width = arg_get_int(&args, 3);
    int height = arg_get_int(&args, 4);

    cairo_surface_mark_dirty_rectangle(surface, x, y, width, height);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void surface_get_device_offset(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);
    double x;
    double y;

    cairo_surface_get_device_offset(surface, &x, &y);

    Dart_Handle point = factory_create_point(x, y);

    Dart_SetReturnValue(args, point);
    Dart_ExitScope();
}


void surface_set_device_offset(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);
    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);

    cairo_surface_set_device_offset(surface, x, y);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}


void surface_copy_page(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);

    cairo_surface_copy_page(surface);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void surface_show_page(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);

    cairo_surface_show_page(surface);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void surface_supports_mime_type(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);
    const char* mime = arg_get_string(&args, 1);

    cairo_bool_t supports = cairo_surface_supports_mime_type(surface, mime);

    Dart_SetReturnValue(args, Dart_NewBoolean(supports != 0));
    Dart_ExitScope();
}


void surface_has_show_text_glyphs(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);

    cairo_bool_t res = cairo_surface_has_show_text_glyphs(surface);

    Dart_SetReturnValue(args, Dart_NewBoolean(res != 0));
    Dart_ExitScope();
}

void surface_get_type(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);

    int type = (int)cairo_surface_get_type(surface);

    Dart_SetReturnValue(args, Dart_NewInteger(type));
    Dart_ExitScope();
}


void surface_get_fallback_resolution(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);
    double xRes;
    double yRes;

    cairo_surface_get_fallback_resolution(surface, &xRes, &yRes);

    Dart_Handle resolutionObj = factory_create_resolution(xRes, yRes);

    Dart_SetReturnValue(args, resolutionObj);
    Dart_ExitScope();
}

void surface_set_fallback_resolution(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);
    double xRes = arg_get_double(&args, 1);
    double yRes = arg_get_double(&args, 2);

    cairo_surface_set_fallback_resolution(surface, xRes, yRes);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void image_surface_create_from_png(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle surfaceObj = arg_get(&args, 0);
    const char* fileName = arg_get_string(&args, 1);

    cairo_surface_t* surface = cairo_image_surface_create_from_png(fileName);

    bind_setup(surface, surfaceObj, surface_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void surface_write_to_png(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);
    const char* fileName = arg_get_string(&args, 1);

    cairo_status_t status = cairo_surface_write_to_png(surface, fileName);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void surfaces_equals(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_surface_t* surface = (cairo_surface_t*) bind_get_self(args);
    Dart_Handle otherObj = arg_get(&args, 1);
    cairo_surface_t* other = (cairo_surface_t*) bind_get(otherObj);

    bool equals = surface == other;
    Dart_SetReturnValue(args, Dart_NewBoolean(equals));
    Dart_ExitScope();
}

