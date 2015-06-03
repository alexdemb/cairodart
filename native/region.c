#include <stdlib.h>
#include <cairo/cairo.h>

#include "argument.h"
#include "error.h"
#include "factory.h"
#include "list.h"
#include "bind.h"
#include "region.h"


void region_destroy(void* handle) {
    if (handle) {
        cairo_region_t* region = (cairo_region_t*) handle;
        if (region) {
            cairo_region_destroy(region);
            region = NULL;
        }
    }
}

void region_create(Dart_NativeArguments args) {
    Dart_Handle obj = arg_get(&args, 0);

    cairo_region_t* reg = cairo_region_create();

    bind_setup(reg, obj, region_destroy);

    Dart_SetReturnValue(args, Dart_Null());
}

void region_create_rectangle(Dart_NativeArguments args) {
    Dart_Handle obj = arg_get(&args, 0);
    int x = arg_get_int(&args, 1);
    int y = arg_get_int(&args, 2);
    int width = arg_get_int(&args, 3);
    int height = arg_get_int(&args, 4);

    cairo_rectangle_int_t rect;
    rect.x = x;
    rect.y = y;
    rect.width = width;
    rect.height = height;

    cairo_region_t* reg = cairo_region_create_rectangle(&rect);

    bind_setup(reg, obj, region_destroy);

    Dart_SetReturnValue(args, Dart_Null());
}

void region_create_rectangles(Dart_NativeArguments args) {
    Dart_Handle obj = arg_get(&args, 0);
    Dart_Handle areas = arg_get(&args, 1);

    int length = list_length(areas);

    cairo_rectangle_int_t rectangles[length / 4];

    int added = 0;

    int i = 0;
    for (i = 0; i < length; i += 4) {
        cairo_rectangle_int_t rect;
        rect.x = list_int_at(areas, i);
        rect.y = list_int_at(areas, i + 1);
        rect.width = list_int_at(areas, i + 2);
        rect.height = list_int_at(areas, i + 3);
        rectangles[added++] = rect;
    }

    cairo_region_t* reg = cairo_region_create_rectangles(rectangles, added);

    bind_setup(reg, obj, region_destroy);

    Dart_SetReturnValue(args, Dart_Null());
}

void region_copy(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);

    cairo_region_t* copy = cairo_region_copy(region);

    Dart_Handle copyObj = factory_create_object("Region", "_internal", NULL, 0);

    bind_setup(copy, copyObj, region_destroy);

    Dart_SetReturnValue(args, copyObj);
}

void region_get_extents(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    cairo_rectangle_int_t extents;

    cairo_region_get_extents(region, &extents);

    Dart_Handle rect = factory_create_rectangle(extents.x, extents.y, extents.width, extents.height);

    Dart_SetReturnValue(args, rect);
}

void region_get_num_rectangles(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    int num = cairo_region_num_rectangles(region);
    Dart_SetReturnValue(args, Dart_NewInteger(num));
}

void region_get_rectangle(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    int nth = arg_get_int(&args, 1);
    cairo_rectangle_int_t rect;

    cairo_region_get_rectangle(region, nth, &rect);

    Dart_Handle res = factory_create_rectangle(rect.x, rect.y, rect.width, rect.height);

    Dart_SetReturnValue(args, res);
}

void region_is_empty(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    cairo_bool_t isEmpty = cairo_region_is_empty(region);

    Dart_SetReturnValue(args, Dart_NewBoolean(isEmpty != 0));
}

void region_contains_point(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    int x = arg_get_int(&args, 1);
    int y = arg_get_int(&args, 1);

    cairo_bool_t res = cairo_region_contains_point(region, x, y);

    Dart_SetReturnValue(args, Dart_NewBoolean(res != 0));
}

void region_contains_rectangle(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    cairo_rectangle_int_t rect;
    rect.x = arg_get_int(&args, 1);
    rect.y = arg_get_int(&args, 2);
    rect.width = arg_get_int(&args, 3);
    rect.height = arg_get_int(&args, 4);

    cairo_region_overlap_t overlap = cairo_region_contains_rectangle(region, &rect);

    Dart_Handle overlapArgs[] = { Dart_NewInteger((int)overlap) };
    Dart_Handle overlapObj = factory_create_object("_RegionOverlap", "", overlapArgs, 1);

    Dart_SetReturnValue(args, overlapObj);
}

void region_equal(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    Dart_Handle otherObj = arg_get(&args, 1);
    cairo_region_t* other = (cairo_region_t*) bind_get(otherObj);

    cairo_bool_t equal = cairo_region_equal(region, other);

    Dart_SetReturnValue(args, Dart_NewBoolean(equal != 0));
}

void region_translate(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    int dx = arg_get_int(&args, 1);
    int dy = arg_get_int(&args, 2);

    cairo_region_translate(region, dx, dy);

    Dart_SetReturnValue(args, Dart_Null());
}

void region_intersect(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    Dart_Handle otherObj = arg_get(&args, 1);
    cairo_region_t* other = (cairo_region_t*) bind_get(otherObj);

    cairo_status_t status = cairo_region_intersect(region, other);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_Null());
}

void region_intersect_rectangle(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    cairo_rectangle_int_t rect;
    rect.x = arg_get_int(&args, 1);
    rect.y = arg_get_int(&args, 2);
    rect.width = arg_get_int(&args, 3);
    rect.height = arg_get_int(&args, 4);

    cairo_status_t status = cairo_region_intersect_rectangle(region, &rect);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_Null());
}

void region_subtract(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    Dart_Handle otherObj = arg_get(&args, 1);
    cairo_region_t* other = (cairo_region_t*) bind_get(otherObj);

    cairo_status_t status = cairo_region_subtract(region, other);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_Null());
}

void region_subtract_rectangle(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    cairo_rectangle_int_t rect;
    rect.x = arg_get_int(&args, 1);
    rect.y = arg_get_int(&args, 2);
    rect.width = arg_get_int(&args, 3);
    rect.height = arg_get_int(&args, 4);

    cairo_status_t status = cairo_region_subtract_rectangle(region, &rect);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_Null());
}

void region_union(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    Dart_Handle otherObj = arg_get(&args, 1);
    cairo_region_t* other = (cairo_region_t*) bind_get(otherObj);

    cairo_status_t status = cairo_region_union(region, other);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_Null());
}

void region_union_rectangle(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    cairo_rectangle_int_t rect;
    rect.x = arg_get_int(&args, 1);
    rect.y = arg_get_int(&args, 2);
    rect.width = arg_get_int(&args, 3);
    rect.height = arg_get_int(&args, 4);

    cairo_status_t status = cairo_region_union_rectangle(region, &rect);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_Null());
}

void region_xor(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    Dart_Handle otherObj = arg_get(&args, 1);
    cairo_region_t* other = (cairo_region_t*) bind_get(otherObj);

    cairo_status_t status = cairo_region_xor(region, other);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_Null());
}

void region_xor_rectangle(Dart_NativeArguments args) {
    cairo_region_t* region = (cairo_region_t*) bind_get_self(args);
    cairo_rectangle_int_t rect;
    rect.x = arg_get_int(&args, 1);
    rect.y = arg_get_int(&args, 2);
    rect.width = arg_get_int(&args, 3);
    rect.height = arg_get_int(&args, 4);

    cairo_status_t status = cairo_region_xor_rectangle(region, &rect);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_Null());
}

