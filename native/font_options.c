#include "stdlib.h"
#include <cairo/cairo.h>
#include "dart_api.h"

#include "font_options.h"
#include "argument.h"
#include "bind.h"
#include "factory.h"
#include "error.h"

void font_options_destroy(void* handle) {
    if (handle) {
        cairo_font_options_t* fontOpts = (cairo_font_options_t*) handle;
        if (fontOpts) {
            cairo_font_options_destroy(fontOpts);
        }
    }
}

void font_options_create(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);

    cairo_font_options_t* opts = cairo_font_options_create();

    bind_setup(opts, obj, font_options_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void font_options_copy(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);

    cairo_font_options_t* copy = cairo_font_options_copy(opts);

    Dart_Handle res = factory_create_object("FontOptions", "_internal", NULL, 0);

    bind_setup(copy, res, font_options_destroy);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void font_options_merge(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);
    Dart_Handle otherObj = arg_get(&args, 1);
    cairo_font_options_t* other = (cairo_font_options_t*) bind_get(otherObj);

    cairo_font_options_merge(opts, other);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void font_options_hash(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);

    unsigned long hash = cairo_font_options_hash(opts);

    Dart_SetReturnValue(args, Dart_NewInteger(hash));
    Dart_ExitScope();
}

void font_options_equal(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);
    Dart_Handle otherObj = arg_get(&args, 1);
    cairo_font_options_t* other = (cairo_font_options_t*) bind_get(otherObj);

    cairo_bool_t equal = cairo_font_options_equal(opts, other);

    Dart_SetReturnValue(args, Dart_NewBoolean(equal != 0));
    Dart_ExitScope();
}

void font_options_set_antialias(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);
    cairo_antialias_t antialias = (cairo_antialias_t) arg_get_int(&args, 1);

    cairo_font_options_set_antialias(opts, antialias);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void font_options_get_antialias(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);

    cairo_antialias_t antialias = cairo_font_options_get_antialias(opts);

    Dart_Handle res = factory_create_antialias(antialias);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void font_options_set_subpixel_order(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);
    cairo_subpixel_order_t order = (cairo_subpixel_order_t) arg_get_int(&args, 1);

    cairo_font_options_set_subpixel_order(opts, order);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void font_options_get_subpixel_order(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);

    cairo_subpixel_order_t order = cairo_font_options_get_subpixel_order(opts);

    Dart_Handle res = factory_create_subpixel_order(order);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void font_options_set_hint_style(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);
    cairo_hint_style_t style = (cairo_hint_style_t) arg_get_int(&args, 1);

    cairo_font_options_set_hint_style(opts, style);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void font_options_get_hint_style(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);

    cairo_hint_style_t style = cairo_font_options_get_hint_style(opts);

    Dart_Handle res = factory_create_hint_style(style);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void font_options_set_hint_metrics(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);
    cairo_hint_metrics_t metrics = (cairo_hint_metrics_t) arg_get_int(&args, 1);

    cairo_font_options_set_hint_metrics(opts, metrics);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void font_options_get_hint_metrics(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);

    cairo_hint_metrics_t metrics = cairo_font_options_get_hint_metrics(opts);

    Dart_Handle res = factory_create_hint_metrics(metrics);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void font_options_status(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_font_options_t* opts = (cairo_font_options_t*) bind_get_self(args);

    cairo_status_t status = cairo_font_options_status(opts);

    Dart_Handle ret = factory_create_status(status);

    Dart_SetReturnValue(args, ret);
    Dart_ExitScope();
}
