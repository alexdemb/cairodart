#include <cairo/cairo.h>
#include "dart_api.h"
#include "format.h"
#include "argument.h"


void format_stride_for_width(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_format_t format = (cairo_format_t) arg_get_int(&args, 1);
    int width = arg_get_int(&args, 2);

    int stride = cairo_format_stride_for_width(format, width);

    Dart_SetReturnValue(args, Dart_NewInteger(stride));
    Dart_ExitScope();
}
