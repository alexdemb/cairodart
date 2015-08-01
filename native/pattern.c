#include <stdlib.h>
#include <cairo/cairo.h>

#include "pattern.h"
#include "matrix.h"
#include "argument.h"
#include "error.h"
#include "bind.h"
#include "factory.h"


void pattern_destroy(void* handle) {
    if (handle) {
        cairo_pattern_t* pattern = (cairo_pattern_t*)handle;
        int refCount = cairo_pattern_get_reference_count(pattern);
        if (pattern && refCount == 1) {
            cairo_pattern_destroy(pattern);
            pattern = NULL;
        }

    }
}

void pattern_create_rgb(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);
    double red = arg_get_double(&args, 1);
    double green = arg_get_double(&args, 2);
    double blue = arg_get_double(&args, 3);

    cairo_pattern_t* pattern = cairo_pattern_create_rgb(red, green, blue);

    bind_setup(pattern, obj, pattern_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_create_rgba(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);
    double red = arg_get_double(&args, 1);
    double green = arg_get_double(&args, 2);
    double blue = arg_get_double(&args, 3);
    double alpha = arg_get_double(&args, 4);

    cairo_pattern_t* pattern = cairo_pattern_create_rgba(red, green, blue, alpha);

    bind_setup(pattern, obj, pattern_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_create_for_surface(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);
    Dart_Handle surfaceObj = arg_get(&args, 1);

    cairo_surface_t* surface = (cairo_surface_t*)bind_get(surfaceObj);

    cairo_pattern_t* pattern = cairo_pattern_create_for_surface(surface);

    bind_setup(pattern, obj, pattern_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_create_linear(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);
    double x0 = arg_get_double(&args, 1);
    double y0 = arg_get_double(&args, 2);
    double x1 = arg_get_double(&args, 3);
    double y1 = arg_get_double(&args, 4);

    cairo_pattern_t* pattern = cairo_pattern_create_linear(x0, y0, x1, y1);

    bind_setup(pattern, obj, pattern_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_create_radial(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);
    double cx0 = arg_get_double(&args, 1);
    double cy0 = arg_get_double(&args, 2);
    double radius0 = arg_get_double(&args, 3);
    double cx1 = arg_get_double(&args, 4);
    double cy1 = arg_get_double(&args, 5);
    double radius1 = arg_get_double(&args, 6);

    cairo_pattern_t* pattern = cairo_pattern_create_radial(cx0, cy0, radius0, cx1, cy1, radius1);

    bind_setup(pattern, obj, pattern_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_create_mesh(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);

    cairo_pattern_t* pattern = cairo_pattern_create_mesh();

    bind_setup(pattern, obj, pattern_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_mesh_begin_patch(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);

    cairo_mesh_pattern_begin_patch(pattern);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_mesh_end_patch(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);

    cairo_mesh_pattern_end_patch(pattern);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_mesh_move_to(Dart_NativeArguments args) {
    Dart_EnterScope();
    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);

    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);

    cairo_mesh_pattern_move_to(pattern, x, y);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_mesh_line_to(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);

    cairo_mesh_pattern_line_to(pattern, x, y);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_mesh_curve_to(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    double x1 = arg_get_double(&args, 1);
    double y1 = arg_get_double(&args, 2);
    double x2 = arg_get_double(&args, 3);
    double y2 = arg_get_double(&args, 4);
    double x3 = arg_get_double(&args, 5);
    double y3 = arg_get_double(&args, 6);

    cairo_mesh_pattern_curve_to(pattern, x1, y1, x2, y2, x3, y3);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_mesh_get_control_point(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    unsigned int patchNum = (unsigned int) arg_get_int(&args, 1);;
    unsigned int pointNum = (unsigned int) arg_get_int(&args, 2);

    double x = 0;
    double y = 0;

    cairo_mesh_pattern_get_control_point(pattern, patchNum, pointNum, &x, &y);

    Dart_Handle point = factory_create_point(x, y);

    Dart_SetReturnValue(args, point);
    Dart_ExitScope();
}

void pattern_mesh_set_control_point(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);

    unsigned int pointNum = (unsigned int) arg_get_int(&args, 1);
    double x = arg_get_double(&args, 2);
    double y = arg_get_double(&args, 3);

    cairo_mesh_pattern_set_control_point(pattern, pointNum, x, y);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_mesh_get_corner_color(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);

    unsigned int patchNum = (unsigned int) arg_get_int(&args, 1);
    unsigned int cornerNum = (unsigned int) arg_get_int(&args, 2);
    double red = 0;
    double green = 0;
    double blue = 0;
    double alpha = 0;

    cairo_mesh_pattern_get_corner_color_rgba(pattern, patchNum, cornerNum, &red, &green, &blue, &alpha);

    Dart_Handle color = factory_create_color(red, green, blue, alpha);

    Dart_SetReturnValue(args, color);
    Dart_ExitScope();
}

void pattern_mesh_set_corner_color(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    unsigned int pointNum = (unsigned int) arg_get_int(&args, 1);
    double red = arg_get_double(&args, 2);
    double green = arg_get_double(&args, 3);
    double blue = arg_get_double(&args, 4);
    double alpha = arg_get_double(&args, 5);

    cairo_mesh_pattern_set_corner_color_rgba(pattern, pointNum, red, green, blue, alpha);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_mesh_get_patch_count(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    unsigned int patchCount;

    cairo_status_t status = cairo_mesh_pattern_get_patch_count(pattern, &patchCount);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_NewInteger(patchCount));
    Dart_ExitScope();
}

void pattern_add_color_stop_rgb(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    double offset = arg_get_double(&args, 1);
    double red = arg_get_double(&args, 2);
    double green = arg_get_double(&args, 3);
    double blue = arg_get_double(&args, 4);

    cairo_pattern_add_color_stop_rgb(pattern, offset, red, green, blue);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_add_color_stop_rgba(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    double offset = arg_get_double(&args, 1);
    double red = arg_get_double(&args, 2);
    double green = arg_get_double(&args, 3);
    double blue = arg_get_double(&args, 4);
    double alpha = arg_get_double(&args, 5);

    cairo_pattern_add_color_stop_rgba(pattern, offset, red, green, blue, alpha);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_get_color_stop_count(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    int count = 0;

    cairo_status_t status = cairo_pattern_get_color_stop_count(pattern, &count);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_NewInteger(count));
    Dart_ExitScope();
}

void pattern_get_color_stop_rgba(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    int index = arg_get_int(&args, 1);
    double offset = 0.0;
    double red = 0.0;
    double green = 0.0;
    double blue = 0.0;
    double alpha = 0.0;

    cairo_status_t status = cairo_pattern_get_color_stop_rgba(pattern, index, &offset, &red, &green, &blue, &alpha);

    error_verify(status);

    Dart_Handle color = factory_create_color(red, green, blue, alpha);

    Dart_Handle colorStop = factory_create_color_stop(color, offset);

    Dart_SetReturnValue(args, colorStop);
    Dart_ExitScope();
}

void pattern_get_linear_points(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    double x0 = 0.0;
    double y0 = 0.0;
    double x1 = 0.0;
    double y1 = 0.0;

    cairo_status_t status = cairo_pattern_get_linear_points(pattern, &x0, &y0, &x1, &y1);

    error_verify(status);

    Dart_Handle point1 = factory_create_point(x0, y0);
    Dart_Handle point2 = factory_create_point(x1, y1);
    Dart_Handle res = Dart_NewList(2);
    Dart_ListSetAt(res, 0, point1);
    Dart_ListSetAt(res, 1, point2);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void pattern_get_radial_circles(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    double x0 = 0.0;
    double y0 = 0.0;
    double r0 = 0.0;
    double x1 = 0.0;
    double y1 = 0.0;
    double r1 = 0.0;

    cairo_status_t status = cairo_pattern_get_radial_circles(pattern, &x0, &y0, &r0, &x1, &y1, &r1);

    error_verify(status);

    Dart_Handle circle1 = factory_create_circle(x0, y0, r0);
    Dart_Handle circle2 = factory_create_circle(x1, y1, r1);
    Dart_Handle res = Dart_NewList(2);
    Dart_ListSetAt(res, 0, circle1);
    Dart_ListSetAt(res, 1, circle2);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}


void pattern_get_extend(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);

    int extend = (int)cairo_pattern_get_extend(pattern);

    Dart_SetReturnValue(args, Dart_NewInteger(extend));
    Dart_ExitScope();
}

void pattern_set_extend(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    int val = arg_get_int(&args, 1);

    cairo_pattern_set_extend(pattern, (cairo_extend_t)val);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_get_filter(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);

    int filter = (int)cairo_pattern_get_filter(pattern);

    Dart_SetReturnValue(args, Dart_NewInteger(filter));
    Dart_ExitScope();
}

void pattern_set_filter(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    int filter = arg_get_int(&args, 1);

    cairo_pattern_set_filter(pattern, (cairo_filter_t)filter);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_get_type(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);

    int type = (int) cairo_pattern_get_type(pattern);

    Dart_SetReturnValue(args, Dart_NewInteger(type));
    Dart_ExitScope();
}

void pattern_get_matrix(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    cairo_matrix_t* matrix = (cairo_matrix_t*)malloc(sizeof(cairo_matrix_t));

    cairo_pattern_get_matrix(pattern, matrix);

    Dart_Handle matrixObj = factory_create_matrix();

    bind_setup((void*)matrix, matrixObj, matrix_destroy);

    Dart_SetReturnValue(args, matrixObj);
    Dart_ExitScope();
}

void pattern_set_matrix(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    Dart_Handle matrixObj = arg_get(&args, 1);
    cairo_matrix_t* matrix = (cairo_matrix_t*) bind_get(matrixObj);

    cairo_pattern_set_matrix(pattern, matrix);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pattern_equals(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);
    Dart_Handle otherObj = arg_get(&args, 1);
    cairo_pattern_t* other = (cairo_pattern_t*) bind_get(otherObj);

    bool equals = pattern == other;
    Dart_SetReturnValue(args, Dart_NewBoolean(equals));
    Dart_ExitScope();
}

void pattern_get_rgba(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);

    double red = 0.0;
    double green = 0.0;
    double blue = 0.0;
    double alpha = 0.0;

    cairo_status_t status = cairo_pattern_get_rgba(pattern, &red, &green, &blue, &alpha);

    error_verify(status);

    Dart_Handle color = factory_create_color(red, green, blue, alpha);

    Dart_SetReturnValue(args, color);

    Dart_ExitScope();
}

void pattern_status(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_pattern_t* pattern = (cairo_pattern_t*) bind_get_self(args);

    cairo_status_t status = cairo_pattern_status(pattern);

    Dart_Handle ret = factory_create_status(status);

    Dart_SetReturnValue(args, ret);
    Dart_ExitScope();
}
