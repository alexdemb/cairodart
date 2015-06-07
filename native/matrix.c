#include <cairo/cairo.h>
#include <stdlib.h>
#include "bind.h"
#include "argument.h"
#include "matrix.h"
#include "factory.h"


void matrix_destroy(void* matrix) {
    if (matrix) {
        cairo_matrix_t* m = (cairo_matrix_t*) matrix;
        free(m);
    }
}

void matrix_create(Dart_NativeArguments args) {
    Dart_Handle obj = arg_get(&args, 0);
    cairo_matrix_t* m = (cairo_matrix_t*) malloc(sizeof(cairo_matrix_t));

    bind_setup((void*)m, obj, matrix_destroy);

    Dart_SetReturnValue(args, Dart_Null());
}

void matrix_xx(Dart_NativeArguments args) {
    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->xx));
}

void matrix_yx(Dart_NativeArguments args) {
    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->yx));
}

void matrix_xy(Dart_NativeArguments args) {
    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->xy));
}

void matrix_yy(Dart_NativeArguments args) {
    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->yy));
}

void matrix_x0(Dart_NativeArguments args) {
    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->x0));
}

void matrix_y0(Dart_NativeArguments args) {
    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->y0));
}

void matrix_init(Dart_NativeArguments args) {
    double xx = arg_get_double(&args, 1);
    double yx = arg_get_double(&args, 2);
    double xy = arg_get_double(&args, 3);
    double yy = arg_get_double(&args, 4);
    double x0 = arg_get_double(&args, 5);
    double y0 = arg_get_double(&args, 6);

    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    cairo_matrix_init(matrix, xx, yx, xy, yy, x0, y0);

    Dart_SetReturnValue(args, Dart_Null());
}

void matrix_init_identity(Dart_NativeArguments args) {
    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    cairo_matrix_init_identity(matrix);
    Dart_SetReturnValue(args, Dart_Null());
}

void matrix_init_translate(Dart_NativeArguments args) {
    double tx = arg_get_double(&args, 1);
    double ty = arg_get_double(&args, 2);

    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    cairo_matrix_init_translate(matrix, tx, ty);

    Dart_SetReturnValue(args, Dart_Null());
}

void matrix_init_scale(Dart_NativeArguments args) {
    double sx = arg_get_double(&args, 1);
    double sy = arg_get_double(&args, 2);

    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    cairo_matrix_init_scale(matrix, sx, sy);

    Dart_SetReturnValue(args, Dart_Null());
}

void matrix_init_rotate(Dart_NativeArguments args) {
    double radians = arg_get_double(&args, 1);

    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    cairo_matrix_init_rotate(matrix, radians);

    Dart_SetReturnValue(args, Dart_Null());
}

void matrix_translate(Dart_NativeArguments args) {
    double tx = arg_get_double(&args, 1);
    double ty = arg_get_double(&args, 2);

    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    cairo_matrix_translate(matrix, tx, ty);

    Dart_SetReturnValue(args, Dart_Null());
}

void matrix_scale(Dart_NativeArguments args) {
    double sx = arg_get_double(&args, 1);
    double sy = arg_get_double(&args, 2);

    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    cairo_matrix_scale(matrix, sx, sy);

    Dart_SetReturnValue(args, Dart_Null());
}

void matrix_rotate(Dart_NativeArguments args) {
    double radians = arg_get_double(&args, 1);

    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    cairo_matrix_rotate(matrix, radians);

    Dart_SetReturnValue(args, Dart_Null());
}

void matrix_invert(Dart_NativeArguments args) {
    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    cairo_matrix_invert(matrix);

    Dart_SetReturnValue(args, Dart_Null());
}

void matrix_transform_point(Dart_NativeArguments args) {
    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    double x = 0.0;
    double y = 0.0;

    cairo_matrix_transform_point(matrix, &x, &y);

    Dart_Handle pointObj = factory_create_point(x, y);

    Dart_SetReturnValue(args, pointObj);
}

void matrix_transform_distance(Dart_NativeArguments args) {
    cairo_matrix_t* matrix = (cairo_matrix_t*)bind_get_self(args);
    double dx = 0.0;
    double dy = 0.0;

    cairo_matrix_transform_distance(matrix, &dx, &dy);

    Dart_Handle distanceObj = factory_create_distance(dx, dy);

    Dart_SetReturnValue(args, distanceObj);
}

void matrix_multiply(Dart_NativeArguments args) {
    Dart_Handle matrix1Obj = arg_get(&args, 0);
    Dart_Handle matrix2Obj = arg_get(&args, 1);

    cairo_matrix_t* m1 = (cairo_matrix_t*)bind_get(matrix1Obj);
    cairo_matrix_t* m2 = (cairo_matrix_t*)bind_get(matrix2Obj);

    cairo_matrix_t* result = (cairo_matrix_t*)malloc(sizeof(cairo_matrix_t));

    cairo_matrix_multiply(result, m1, m2);

    Dart_Handle resultObj = factory_create_object("_Matrix", "internal", NULL, 0);

    bind_setup(result, resultObj, matrix_destroy);

    Dart_SetReturnValue(args, resultObj);
}
