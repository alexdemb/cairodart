#include <stdlib.h>

#include "factory.h"
#include "error.h"
#include "library.h"

Dart_Handle factory_create_object(const char* className, const char* ctorName, Dart_Handle* args, int argc) {
    Dart_Handle constructorName = ctorName == NULL ? Dart_Null() : Dart_NewStringFromCString(ctorName);
    Dart_Handle clazz = Dart_NewStringFromCString(className);
    Dart_Handle type = Dart_GetClass(library_get(), clazz);
    error_check_handle(type);
    Dart_Handle obj = Dart_New(type, constructorName, argc, args);
    error_check_handle(obj);
    return obj;
}

Dart_Handle factory_create_point(const double x, const double y) {
    Dart_Handle args[] = { Dart_NewDouble(x), Dart_NewDouble(y) };
    return factory_create_object("Point", "from", args, 2);
}

Dart_Handle factory_create_distance(const double dx, const double dy) {
    Dart_Handle args[] = { Dart_NewDouble(dx), Dart_NewDouble(dy) };
    return factory_create_object("Distance", "from", args, 2);
}


Dart_Handle factory_create_rectangle(const int x, const int y, const int width, const int height) {
    return factory_create_rectangle_double(x, y, width, height);
}

Dart_Handle factory_create_rectangle_double(const double x, const double y, const double width, const double height) {
    Dart_Handle parameters[4] =
    {
        Dart_NewDouble(x),
        Dart_NewDouble(y),
        Dart_NewDouble(width),
        Dart_NewDouble(height)
    };
    return factory_create_object("Rectangle", "", parameters, 4);
}


Dart_Handle factory_create_resolution(const double xRes, const double yRes) {
    Dart_Handle resArgs[2] = { Dart_NewDouble(xRes), Dart_NewDouble(yRes) };
    return factory_create_object("Resolution", "", resArgs, 2);
}

Dart_Handle factory_create_color(const double red, const double green, const double blue, const double alpha) {
    Dart_Handle colorArgs[4] =
    {
        Dart_NewDouble(red),
        Dart_NewDouble(green),
        Dart_NewDouble(blue),
        Dart_NewDouble(alpha)
    };
    return factory_create_object("Color", "rgba", colorArgs, 4);
}

Dart_Handle factory_create_color_stop(Dart_Handle color, double offset) {
    Dart_Handle colorStopArgs[2] = { color, Dart_NewDouble(offset) };
    return factory_create_object("ColorStop", "", colorStopArgs, 2);
}

Dart_Handle factory_create_circle(const double x, const double y, const double radius) {
    Dart_Handle args[3] = { Dart_NewDouble(x), Dart_NewDouble(y), Dart_NewDouble(radius) };
    return factory_create_object("Circle", "", args, 3);
}

Dart_Handle factory_create_matrix() {
    return factory_create_object("_Matrix", "internal", NULL, 0);
}

Dart_Handle factory_create_line_cap(cairo_line_cap_t cap) {
    Dart_Handle capArgs[1] = { Dart_NewInteger((int)cap) };
    return factory_create_object("_LineCap", "", capArgs, 1);
}

Dart_Handle factory_create_line_joint(cairo_line_join_t join) {
    Dart_Handle joinArgs[1] = { Dart_NewInteger((int)join) };
    return factory_create_object("_LineJoin", "", joinArgs, 1);
}

Dart_Handle factory_create_operator(cairo_operator_t op) {
    Dart_Handle opArgs[1] = { Dart_NewInteger((int)op) };
    return factory_create_object("_Operator", "", opArgs, 1);
}

Dart_Handle factory_create_fill_rule(cairo_fill_rule_t rule) {
    Dart_Handle ruleArgs[1] = { Dart_NewInteger((int)rule) };
    return factory_create_object("_FillRule", "", ruleArgs, 1);
}

Dart_Handle factory_create_antialias(cairo_antialias_t antialias) {
    Dart_Handle args[1] = { Dart_NewInteger((int)antialias) };
    return factory_create_object("_Antialias", "", args, 1);
}

Dart_Handle factory_create_subpixel_order(cairo_subpixel_order_t order) {
    Dart_Handle args[1] = { Dart_NewInteger((int)order) };
    return factory_create_object("_SubpixelOrder", "", args, 1);
}

Dart_Handle factory_create_hint_style(cairo_hint_style_t style) {
    Dart_Handle args[1] = { Dart_NewInteger((int)style) };
    return factory_create_object("_HintStyle", "", args, 1);
}

Dart_Handle factory_create_hint_metrics(cairo_hint_metrics_t metrics) {
    Dart_Handle args[1] = { Dart_NewInteger((int)metrics) };
    return factory_create_object("_HintMetrics", "", args, 1);
}

static Dart_Handle factory_create_dart_rectangle_list(Dart_Handle context, const cairo_rectangle_list_t* list, Dart_Handle rectsList) {
    Dart_Handle ctorArgs[] = { context, Dart_NewInteger((int)list->status), rectsList };
    return factory_create_object("_RectangleList", "", ctorArgs, 3);
}

Dart_Handle factory_create_rectangle_list(const Dart_Handle context, const cairo_rectangle_list_t* list) {
    const int COUNT = list->num_rectangles;
    Dart_Handle rectsList = Dart_NewList(COUNT);

    int i = 0;
    for (i = 0; i < COUNT; i++) {
        Dart_Handle rect = factory_create_rectangle(
                    list->rectangles[i].x,
                    list->rectangles[i].y,
                    list->rectangles[i].width,
                    list->rectangles[i].height);

        Dart_ListSetAt(rectsList, i, rect);
    }

    return factory_create_dart_rectangle_list(context, list, rectsList);
}

Dart_Handle factory_create_pattern(cairo_pattern_t *pattern) {
    Dart_Handle patternObj;
    cairo_pattern_type_t type = cairo_pattern_get_type(pattern);
    if (CAIRO_PATTERN_TYPE_MESH == type) {
        patternObj = factory_create_object("_MeshPattern", "", NULL, 0);
    }
    else {
        patternObj = factory_create_object("_Pattern", "", NULL, 0);
    }

    return patternObj;
}

Dart_Handle factory_create_surface(cairo_surface_t* surface) {
    Dart_Handle surfaceObj;

    cairo_surface_type_t type = cairo_surface_get_type(surface);

    switch (type)
    {
    case CAIRO_SURFACE_TYPE_IMAGE:
        surfaceObj = factory_create_object("_ImageSurface", "internal", NULL, 0);
        break;
    default:
        surfaceObj = factory_create_object("_Surface", "", NULL, 0);
        break;
    }

    return surfaceObj;
}

Dart_Handle factory_create_font_type(cairo_font_type_t fontType) {
    Dart_Handle args[1] = { Dart_NewInteger((int)fontType) };
    return factory_create_object("_FontType", "", args, 1);
}

Dart_Handle factory_create_font_extents(const cairo_font_extents_t* extents) {
    Dart_Handle args[5] =
    {
        Dart_NewDouble(extents->ascent),
        Dart_NewDouble(extents->descent),
        Dart_NewDouble(extents->height),
        Dart_NewDouble(extents->max_x_advance),
        Dart_NewDouble(extents->max_y_advance)
    };

    return factory_create_object("_FontExtents", "", args, 5);
}

Dart_Handle factory_create_text_extents(const cairo_text_extents_t* extents) {
    Dart_Handle args[6] =
    {
        Dart_NewDouble(extents->x_bearing),
        Dart_NewDouble(extents->y_bearing),
        Dart_NewDouble(extents->width),
        Dart_NewDouble(extents->height),
        Dart_NewDouble(extents->x_advance),
        Dart_NewDouble(extents->y_advance)
    };

    return factory_create_object("_TextExtents", "", args, 6);
}

