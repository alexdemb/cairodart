#include <stdlib.h>
#include <cairo/cairo.h>
#include "dart_api.h"

#include "list.h"
#include "context.h"
#include "error.h"
#include "argument.h"
#include "bind.h"
#include "factory.h"
#include "pattern.h"
#include "surface.h"

void context_destroy(void* handle) {
    if (handle) {
        cairo_t* context = (cairo_t*) handle;
        if (context) {
            cairo_destroy(context);
        }
    }
}

void context_create(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);
    Dart_Handle surfaceObj = arg_get(&args, 1);

    cairo_surface_t* surface = (cairo_surface_t*) bind_get(surfaceObj);

    cairo_t* context = cairo_create(surface);

    bind_setup(context, obj, context_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}


void save(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_save(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void restore(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_restore(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void push_group(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_push_group(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void push_group_with_content(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    int content = arg_get_int(&args, 1);

    cairo_push_group_with_content(context, (cairo_content_t)content);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void pop_group_to_source(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_pop_group_to_source(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void set_source_rgb(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double r = arg_get_double(&args, 1);
    double g = arg_get_double(&args, 2);
    double b = arg_get_double(&args, 3);

    cairo_set_source_rgb(context, r, g, b);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void set_source_rgba(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double r = arg_get_double(&args, 1);
    double g = arg_get_double(&args, 2);
    double b = arg_get_double(&args, 3);
    double a = arg_get_double(&args, 4);

    cairo_set_source_rgba(context, r, g, b, a);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void stroke(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_stroke(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void stroke_preserve(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_stroke_preserve(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void in_stroke(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);

    cairo_bool_t inStroke = cairo_in_stroke(context, x, y);

    Dart_SetReturnValue(args, Dart_NewBoolean(inStroke != 0));
    Dart_ExitScope();
}

void stroke_extents(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x1, y1, x2, y2;

    cairo_stroke_extents(context, &x1, &y1, &x2, &y2);

    double width = x2 - x1;
    double height = y2 - y1;

    Dart_Handle rect = factory_create_rectangle_double(x1, y1, width, height);

    Dart_SetReturnValue(args, rect);
    Dart_ExitScope();
}

void paint(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_paint(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}


void set_line_cap(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_line_cap_t cap = (cairo_line_cap_t) arg_get_int(&args, 1);

    cairo_set_line_cap(context, cap);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void get_line_cap(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_line_cap_t cap = cairo_get_line_cap(context);

    Dart_Handle capObj = factory_create_line_cap(cap);
    Dart_SetReturnValue(args, capObj);
    Dart_ExitScope();
}

void set_line_join(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_line_join_t joint  = (cairo_line_join_t)arg_get_int(&args, 1);

    cairo_set_line_join(context, joint);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void get_line_join(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_line_join_t joint = cairo_get_line_join(context);

    Dart_Handle joinObj = factory_create_line_joint(joint);
    Dart_SetReturnValue(args, joinObj);
    Dart_ExitScope();
}

void set_line_width(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double width = arg_get_double(&args, 1);

    cairo_set_line_width(context, width);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void get_line_width(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    double width = cairo_get_line_width(context);

    Dart_SetReturnValue(args, Dart_NewDouble(width));
    Dart_ExitScope();
}

void set_miter_limit(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double limit = arg_get_double(&args, 1);

    cairo_set_miter_limit(context, limit);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void get_miter_limit(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    double limit = cairo_get_miter_limit(context);

    Dart_SetReturnValue(args, Dart_NewDouble(limit));
    Dart_ExitScope();
}

void set_operator(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_operator_t op = (cairo_operator_t)arg_get_int(&args, 1);

    cairo_set_operator(context, op);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void get_operator(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_operator_t op = (cairo_operator_t) cairo_get_operator(context);

    Dart_Handle opObj = factory_create_operator(op);

    Dart_SetReturnValue(args, opObj);
    Dart_ExitScope();
}

void set_fill_rule(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_fill_rule_t rule = (cairo_fill_rule_t) arg_get_int(&args, 1);

    cairo_set_fill_rule(context, rule);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void get_fill_rule(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_fill_rule_t rule = cairo_get_fill_rule(context);

    Dart_Handle ruleObj = factory_create_fill_rule(rule);
    Dart_SetReturnValue(args, ruleObj);
    Dart_ExitScope();
}

void has_current_point(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_bool_t has = cairo_has_current_point(context);

    Dart_SetReturnValue(args, Dart_NewBoolean(has != 0));
    Dart_ExitScope();
}

void move_to(Dart_NativeArguments args) {
    Dart_EnterScope();
    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_move_to(context, x, y);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void line_to(Dart_NativeArguments args) {
    Dart_EnterScope();
    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_line_to(context, x, y);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void rectangle(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);
    double w = arg_get_double(&args, 3);
    double h = arg_get_double(&args, 4);

    cairo_rectangle(context, x, y, w, h);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void get_current_point(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x = 0.0;
    double y = 0.0;

    cairo_get_current_point(context, &x, &y);

    Dart_Handle point = factory_create_point(x, y);
    Dart_SetReturnValue(args, point);
    Dart_ExitScope();
}

void new_path(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_new_path(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void new_sub_path(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_new_sub_path(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void close_path(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_close_path(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void arc(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double xc = arg_get_double(&args, 1);
    double yc = arg_get_double(&args, 2);
    double radius = arg_get_double(&args, 3);
    double angle1 = arg_get_double(&args, 4);
    double angle2 = arg_get_double(&args, 5);

    cairo_arc(context, xc, yc, radius, angle1, angle2);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void arc_negative(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double xc = arg_get_double(&args, 1);
    double yc = arg_get_double(&args, 2);
    double radius = arg_get_double(&args, 3);
    double angle1 = arg_get_double(&args, 4);
    double angle2 = arg_get_double(&args, 5);

    cairo_arc_negative(context, xc, yc, radius, angle1, angle2);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void curve_to(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x1 = arg_get_double(&args, 1);
    double y1 = arg_get_double(&args, 2);
    double x2 = arg_get_double(&args, 3);
    double y2 = arg_get_double(&args, 4);
    double x3 = arg_get_double(&args, 5);
    double y3 = arg_get_double(&args, 6);

    cairo_curve_to(context, x1, y1, x2, y2, x3, y3);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void rel_line_to(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);

    cairo_rel_line_to(context, x, y);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void rel_move_to(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);

    cairo_rel_move_to(context, x, y);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void rel_curve_to(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x1 = arg_get_double(&args, 1);
    double y1 = arg_get_double(&args, 2);
    double x2 = arg_get_double(&args, 3);
    double y2 = arg_get_double(&args, 4);
    double x3 = arg_get_double(&args, 5);
    double y3 = arg_get_double(&args, 6);

    cairo_rel_curve_to(context, x1, y1, x2, y2, x3, y3);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void text_path(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    const char* text = arg_get_string(&args, 1);

    cairo_text_path(context, text);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void path_extents(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x1, y1, x2, y2 = 0.0D;

    cairo_path_extents(context, &x1, &y1, &x2, &y2);

    Dart_Handle rect =  factory_create_rectangle_double(x1, y1, x1 + x2, y1 + y2);
    Dart_SetReturnValue(args, rect);
    Dart_ExitScope();
}

void get_antialias(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_antialias_t antialias = cairo_get_antialias(context);

    Dart_Handle result = factory_create_antialias(antialias);

    Dart_SetReturnValue(args, result);
    Dart_ExitScope();
}

void set_antialias(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_antialias_t antialias = (cairo_antialias_t) arg_get_int(&args, 1);

    cairo_set_antialias(context, antialias);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void get_tolerance(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    double tolerance = cairo_get_tolerance(context);

    Dart_SetReturnValue(args, Dart_NewDouble(tolerance));
    Dart_ExitScope();
}

void set_tolerance(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double tolerance = arg_get_double(&args, 1);

    cairo_set_tolerance(context, tolerance);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void clip(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_clip(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void clip_preserve(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_clip_preserve(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void in_clip(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);

    cairo_bool_t result = cairo_in_clip(context, x, y);

    Dart_SetReturnValue(args, Dart_NewBoolean(result != 0));
    Dart_ExitScope();
}

void reset_clip(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_reset_clip(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void clip_extents(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x1, y1, x2, y2;

    cairo_clip_extents(context, &x1, &y1, &x2, &y2);

    double width = x2 - x1;
    double height = y2 - y1;

    Dart_Handle rect = factory_create_rectangle_double(x1, y1, width, height);

    Dart_SetReturnValue(args, rect);
    Dart_ExitScope();
}

void fill(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_fill(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void fill_preserve(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_fill_preserve(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void fill_extents(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x1, y1, x2, y2;

    cairo_fill_extents(context, &x1, &y1, &x2, &y2);

    double width = x2 - x1;
    double height = y2 - y1;

    Dart_Handle rect = factory_create_rectangle_double(x1, y1, width, height);

    Dart_SetReturnValue(args, rect);
    Dart_ExitScope();
}

void in_fill(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);

    cairo_bool_t result = cairo_in_fill(context, x, y);
    Dart_SetReturnValue(args, Dart_NewBoolean(result != 0));
    Dart_ExitScope();
}


void copy_clip_rectangle_list(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle contextObj = arg_get(&args, 0);
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_rectangle_list_t* rectList = cairo_copy_clip_rectangle_list(context);

    Dart_Handle result = factory_create_rectangle_list(contextObj, rectList);
    bind_setup(rectList, result, NULL);

    Dart_SetReturnValue(args, result);
    Dart_ExitScope();
}

void rectangle_list_destroy(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle rectList = arg_get(&args, 1);

    cairo_rectangle_list_t* list = (cairo_rectangle_list_t*)bind_get(rectList);

    cairo_rectangle_list_destroy(list);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void mask(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    Dart_Handle patternArg = arg_get(&args, 1);
    cairo_pattern_t* pattern = (cairo_pattern_t*)bind_get(patternArg);

    cairo_mask(context, pattern);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void mask_surface(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    Dart_Handle surfaceArg = arg_get(&args, 1);
    double x = arg_get_double(&args, 2);
    double y = arg_get_double(&args, 3);
    cairo_surface_t* surface = (cairo_surface_t*) bind_get(surfaceArg);

    cairo_mask_surface(context, surface, x, y);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void paint_with_alpha(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double alpha = arg_get_double(&args, 1);

    cairo_paint_with_alpha(context, alpha);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void show_page(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_show_page(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void copy_page(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    cairo_copy_page(context);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void set_dash(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    Dart_Handle dashesList = arg_get(&args, 1);
    double offset = arg_get_double(&args, 2);;

    intptr_t num = 0;
    error_check_handle(Dart_ListLength(dashesList, &num));

    double dashes[num];
    int i = 0;
    for (i = 0; i < num; i++) {
       double val = list_double_at(dashesList, i);
       dashes[i] = val;
    }

    cairo_set_dash(context, dashes, num, offset);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void get_dash(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);

    int count = cairo_get_dash_count(context);

    double dashes[count];
    double offset = 0.0D;

    cairo_get_dash(context, dashes, &offset);

    Dart_Handle dashesHandle = Dart_NewList(count);
    error_check_handle(dashesHandle);
    int i = 0;
    for (i = 0; i < count; i++) {
        Dart_ListSetAt(dashesHandle, i, Dart_NewDouble(dashes[i]));
    }

    Dart_Handle offsetHandle = Dart_NewDouble(offset);

    Dart_Handle ctorArgs[2] = { dashesHandle, offsetHandle };
    Dart_Handle dash = factory_create_object("_Dash", "", ctorArgs, 2);

    Dart_SetReturnValue(args, dash);
    Dart_ExitScope();
}

void get_dash_count(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    int count = cairo_get_dash_count(context);
    Dart_SetReturnValue(args, Dart_NewInteger(count));
    Dart_ExitScope();
}

void pop_group(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_pattern_t* pattern = cairo_pop_group(context);

    Dart_Handle patternObj = factory_create_pattern(pattern);
    bind_setup(pattern, patternObj, pattern_destroy);

    Dart_SetReturnValue(args, patternObj);
    Dart_ExitScope();
}

void set_source(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    Dart_Handle patternObj = arg_get(&args, 1);
    cairo_pattern_t* pattern = (cairo_pattern_t*)bind_get(patternObj);

    cairo_set_source(context, pattern);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void get_source(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_pattern_t* pattern = cairo_get_source(context);

    pattern = cairo_pattern_reference(pattern);

    Dart_Handle patternObj = pattern ? factory_create_pattern(pattern) : Dart_Null();
    bind_setup(pattern, patternObj, pattern_destroy);

    Dart_SetReturnValue(args, patternObj);
    Dart_ExitScope();
}

void set_source_surface(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    Dart_Handle surfaceObj = arg_get(&args, 1);
    double x = arg_get_double(&args, 2);
    double y = arg_get_double(&args, 3);
    cairo_surface_t* surface = (cairo_surface_t*) bind_get(surfaceObj);

    cairo_set_source_surface(context, surface, x, y);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void get_group_target(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_surface_t* surface = cairo_get_group_target(context);
    surface = cairo_surface_reference(surface);

    Dart_Handle res = factory_create_surface(surface);

    bind_setup(surface, res, surface_destroy);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void translate(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double tx = arg_get_double(&args, 1);
    double ty = arg_get_double(&args, 2);

    cairo_translate(context, tx, ty);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void transform(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_matrix_t* matrix = (cairo_matrix_t*) bind_get(arg_get(&args, 1));

    cairo_transform(context, matrix);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}


void status(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    cairo_status_t status = cairo_status(context);

    Dart_Handle res = factory_create_status(status);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}


void select_font_face(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    const char* family = arg_get_string(&args, 1);
    cairo_font_slant_t slant = (cairo_font_slant_t)arg_get_int(&args, 2);
    cairo_font_weight_t weight = (cairo_font_weight_t)arg_get_int(&args, 3);

    cairo_select_font_face(context, family, slant, weight);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}


void set_font_size(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    double size = arg_get_double(&args, 1);

    cairo_set_font_size(context, size);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}


void show_text(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_t* context = (cairo_t*)bind_get_self(args);
    const char* text = arg_get_string(&args, 1);

    cairo_show_text(context, text);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

