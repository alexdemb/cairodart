#include <map>
#include <cairo/cairo.h>
#include <cstdint>
#include <vector>

#include "cairodart.h"
#include "infrastructure/infrastructure.h"
#include "surface.h"
#include "imagesurface.h"
#include "context.h"
#include "pattern.h"
#include "meshpattern.h"
#include "matrix.h"
#include "region.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

static std::map<std::string, Dart_NativeFunction> FUNCTIONS_MAP =
{
  { "context_create", CairoDart::context_create },
  { "save", CairoDart::save },
  { "restore", CairoDart::restore },
  { "push_group", CairoDart::push_group },
  { "push_group_with_content", CairoDart::push_group_with_content },
  { "pop_group_to_source", CairoDart::pop_group_to_source },
  { "set_source_rgb", CairoDart::set_source_rgb },
  { "set_source_rgba", CairoDart::set_source_rgba },
  { "stroke", CairoDart::stroke },
  { "paint", CairoDart::paint },
  { "set_line_cap", CairoDart::set_line_cap },
  { "get_line_cap", CairoDart::get_line_cap },
  { "set_line_join", CairoDart::set_line_join },
  { "get_line_join", CairoDart::get_line_join },
  { "set_line_width", CairoDart::set_line_width },
  { "get_line_width", CairoDart::get_line_width },
  { "set_miter_limit", CairoDart::set_miter_limit },
  { "get_miter_limit", CairoDart::get_miter_limit },
  { "set_operator", CairoDart::set_operator },
  { "get_operator", CairoDart::get_operator },
  { "set_fill_rule", CairoDart::set_fill_rule },
  { "get_fill_rule", CairoDart::get_fill_rule },
  { "has_current_point", CairoDart::has_current_point },
  { "move_to", CairoDart::move_to },
  { "line_to", CairoDart::line_to },
  { "rectangle", CairoDart::rectangle },
  { "get_current_point", CairoDart::get_current_point },
  { "new_path", CairoDart::new_path },
  { "new_sub_path", CairoDart::new_sub_path },
  { "close_path", CairoDart::close_path },
  { "arc", CairoDart::arc },
  { "arc_negative", CairoDart::arc_negative },
  { "curve_to", CairoDart::curve_to },
  { "rel_curve_to", CairoDart::rel_curve_to },
  { "rel_line_to", CairoDart::rel_line_to },
  { "rel_move_to", CairoDart::rel_move_to },
  { "text_path", CairoDart::text_path },
  { "image_surface_create", CairoDart::image_surface_create },
  { "image_surface_get_width", CairoDart::image_surface_get_width },
  { "image_surface_get_height", CairoDart::image_surface_get_height },
  { "format_stride_for_width", CairoDart::format_stride_for_width },
  { "image_surface_get_stride", CairoDart::image_surface_get_stride },
  { "surface_finish", CairoDart::surface_finish },
  { "surface_flush", CairoDart::surface_flush },
  { "surface_get_content", CairoDart::surface_get_content },
  { "surface_mark_dirty", CairoDart::surface_mark_dirty },
  { "surface_mark_dirty_rectangle", CairoDart::surface_mark_dirty_rectangle },
  { "surface_get_device_offset", CairoDart::surface_get_device_offset },
  { "surface_set_device_offset", CairoDart::surface_set_device_offset },
  { "surface_copy_page", CairoDart::surface_copy_page },
  { "surface_show_page", CairoDart::surface_show_page },
  { "surface_has_show_text_glyphs", CairoDart::surface_has_show_text_glyphs },
  { "surface_supports_mime_type", CairoDart::surface_supports_mime_type },
  { "surface_get_type", CairoDart::surface_get_type },
  { "surface_get_fallback_resolution", CairoDart::surface_get_fallback_resolution },
  { "surface_set_fallback_resolution", CairoDart::surface_set_fallback_resolution },
  { "pattern_create_rgb", CairoDart::pattern_create_rgb },
  { "pattern_create_rgba", CairoDart::pattern_create_rgba },
  { "pattern_create_for_surface", CairoDart::pattern_create_for_surface },
  { "pattern_create_linear", CairoDart::pattern_create_linear },
  { "pattern_create_radial", CairoDart::pattern_create_radial },
  { "pattern_create_mesh", CairoDart::pattern_create_mesh },
  { "pattern_mesh_begin_patch", CairoDart::pattern_mesh_begin_patch },
  { "pattern_mesh_end_patch", CairoDart::pattern_mesh_end_patch },
  { "pattern_mesh_move_to", CairoDart::pattern_mesh_move_to },
  { "pattern_mesh_line_to", CairoDart::pattern_mesh_line_to },
  { "pattern_mesh_curve_to", CairoDart::pattern_mesh_curve_to },
  { "pattern_mesh_get_control_point", CairoDart::pattern_mesh_get_control_point },
  { "pattern_mesh_set_control_point", CairoDart::pattern_mesh_set_control_point },
  { "pattern_mesh_get_corner_color", CairoDart::pattern_mesh_get_corner_color },
  { "pattern_mesh_set_corner_color", CairoDart::pattern_mesh_set_corner_color },
  { "pattern_mesh_get_patch_count", CairoDart::pattern_mesh_get_patch_count },
  { "pattern_add_color_stop_rgb", CairoDart::pattern_add_color_stop_rgb },
  { "pattern_add_color_stop_rgba", CairoDart::pattern_add_color_stop_rgba },
  { "pattern_get_color_stop_count", CairoDart::pattern_get_color_stop_count },
  { "pattern_get_color_stop_rgba", CairoDart::pattern_get_color_stop_rgba },
  { "pattern_get_linear_points", CairoDart::pattern_get_linear_points },
  { "pattern_get_radial_circles", CairoDart::pattern_get_radial_circles },
  { "pattern_get_extend", CairoDart::pattern_get_extend },
  { "pattern_set_extend", CairoDart::pattern_set_extend },
  { "pattern_get_filter", CairoDart::pattern_get_filter },
  { "pattern_set_filter", CairoDart::pattern_set_filter },
  { "pattern_get_type", CairoDart::pattern_get_type },
  { "pattern_get_matrix", CairoDart::pattern_get_matrix },
  { "pattern_set_matrix", CairoDart::pattern_set_matrix },
  { "matrix_create", CairoDart::matrix_create },
  { "matrix_xx", CairoDart::matrix_xx },
  { "matrix_yx", CairoDart::matrix_yx },
  { "matrix_xy", CairoDart::matrix_xy },
  { "matrix_yy", CairoDart::matrix_yy },
  { "matrix_x0", CairoDart::matrix_x0 },
  { "matrix_y0", CairoDart::matrix_y0 },
  { "matrix_init", CairoDart::matrix_init },
  { "matrix_init_identity", CairoDart::matrix_init_identity },
  { "matrix_init_translate", CairoDart::matrix_init_translate },
  { "matrix_init_scale", CairoDart::matrix_init_scale },
  { "matrix_init_rotate", CairoDart::matrix_init_rotate },
  { "matrix_translate", CairoDart::matrix_translate },
  { "matrix_scale", CairoDart::matrix_scale },
  { "matrix_rotate", CairoDart::matrix_rotate },
  { "matrix_invert", CairoDart::matrix_invert },
  { "matrix_transform_point", CairoDart::matrix_transform_point },
  { "matrix_transform_distance", CairoDart::matrix_transform_distance },
  { "matrix_multiply", CairoDart::matrix_multiply },
  { "region_create", CairoDart::region_create },
  { "region_create_rectangle", CairoDart::region_create_rectangle },
  { "region_create_rectangles", CairoDart::region_create_rectangles },
  { "region_copy", CairoDart::region_copy },
  { "region_get_extents", CairoDart::region_get_extents },
  { "region_get_num_rectangles", CairoDart::region_get_num_rectangles },
  { "region_get_rectangle", CairoDart::region_get_rectangle },
  { "region_is_empty", CairoDart::region_is_empty },
  { "region_contains_point", CairoDart::region_contains_point },
  { "region_contains_rectangle", CairoDart::region_contains_rectangle },
  { "region_equal", CairoDart::region_equal },
  { "region_translate", CairoDart::region_translate },
  { "region_intersect", CairoDart::region_intersect },
  { "region_intersect_rectangle", CairoDart::region_intersect_rectangle },
  { "region_subtract", CairoDart::region_subtract },
  { "region_subtract_rectangle", CairoDart::region_subtract_rectangle },
  { "region_union", CairoDart::region_union },
  { "region_union_rectangle", CairoDart::region_union_rectangle },
  { "region_xor", CairoDart::region_xor },
  { "region_xor_rectangle", CairoDart::region_xor_rectangle }

};

CairoDart::CairoDart()
{
}

Dart_NativeFunction CairoDart::resolve(std::string& name)
{
    auto iter = FUNCTIONS_MAP.find(name);
    if (iter == FUNCTIONS_MAP.end())
        return NULL;

    return iter->second;
}

// cairo_t

void CairoDart::context_create(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    Dart_Handle surfaceObj = arg.arg(1);

    Surface* surface = Utils::bindingObject<Surface>(surfaceObj);

    Context* ctx = new Context(surface);

    Utils::setupBindingObject<Context>(obj, ctx);

    Dart_SetReturnValue(args, Dart_Null());
}


void CairoDart::save(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->save();

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::restore(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->restore();

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::push_group(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->pushGroup();

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::push_group_with_content(Dart_NativeArguments args)
{
    Arguments arg = args;
    int content = arg.intArg(1);

    Context* ctx = Utils::thisFromArg<Context>(args);

    ctx->pushGroupWithContent(static_cast<cairo_content_t>(content));

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pop_group_to_source(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->popGroupToSource();

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::set_source_rgb(Dart_NativeArguments args)
{
    Arguments arg = args;
    Context* ctx = Utils::thisFromArg<Context>(args);
    double r = arg.doubleArg(1);
    double g = arg.doubleArg(2);
    double b = arg.doubleArg(3);

    ctx->setSourceRgb(r, g, b);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::set_source_rgba(Dart_NativeArguments args)
{
    Arguments arg = args;
    Context* ctx = Utils::thisFromArg<Context>(args);
    double r = arg.doubleArg(1);
    double g = arg.doubleArg(2);
    double b = arg.doubleArg(3);
    double a = arg.doubleArg(4);

    ctx->setSourceRgba(r, g, b, a);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::stroke(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->stroke();

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::paint(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->paint();

    Dart_SetReturnValue(args, Dart_Null());
}


void CairoDart::set_line_cap(Dart_NativeArguments args)
{
    Arguments arg = args;
    Context* ctx = Utils::thisFromArg<Context>(args);
    cairo_line_cap_t cap = static_cast<cairo_line_cap_t>(arg.intArg(1));
    ctx->setLineCap(cap);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::get_line_cap(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    cairo_line_cap_t cap = ctx->getLineCap();
    int c = static_cast<int>(cap);

    Dart_Handle capArgs[1] = { Dart_NewInteger(c) };
    Dart_Handle capObj = Utils::newObject("_LineCap", "", 1, capArgs);
    Dart_SetReturnValue(args, capObj);
}

void CairoDart::set_line_join(Dart_NativeArguments args)
{
    Arguments arg = args;
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->setLineJoin(static_cast<cairo_line_join_t>(arg.intArg(1)));
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::get_line_join(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    cairo_line_join_t join = ctx->getLineJoin();

    int j = static_cast<int>(join);

    Dart_Handle joinArgs[1] = { Dart_NewInteger(j) };
    Dart_Handle joinObj = Utils::newObject("_LineJoin", "", 1, joinArgs);
    Dart_SetReturnValue(args, joinObj);
}

void CairoDart::set_line_width(Dart_NativeArguments args)
{
    Arguments arg = args;
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->setLineWidth(arg.doubleArg(1));
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::get_line_width(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    double width = ctx->getLineWidth();
    Dart_SetReturnValue(args, Dart_NewDouble(width));
}

void CairoDart::set_miter_limit(Dart_NativeArguments args)
{
    Arguments arg = args;
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->setMiterLimit(arg.doubleArg(1));
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::get_miter_limit(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    double limit = ctx->getMiterLimit();
    Dart_SetReturnValue(args, Dart_NewDouble(limit));
}

void CairoDart::set_operator(Dart_NativeArguments args)
{
    Arguments arg = args;
    Context* ctx = Utils::thisFromArg<Context>(args);
    cairo_operator_t op = static_cast<cairo_operator_t>(arg.intArg(1));
    ctx->setOperator(op);
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::get_operator(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    int op = static_cast<int>(ctx->getOperator());

    Dart_Handle opArgs[1] = { Dart_NewInteger(op) };
    Dart_Handle opObj = Utils::newObject("_Operator", "", 1, opArgs);
    Dart_SetReturnValue(args, opObj);
}

void CairoDart::set_fill_rule(Dart_NativeArguments args)
{
    Arguments arg = args;
    Context* ctx = Utils::thisFromArg<Context>(args);
    cairo_fill_rule_t rule = static_cast<cairo_fill_rule_t>(arg.intArg(1));
    ctx->setFillRule(rule);
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::get_fill_rule(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    int rule = static_cast<int>(ctx->getFillRule());

    Dart_Handle ruleArgs[1] = { Dart_NewInteger(rule) };
    Dart_Handle ruleObj = Utils::newObject("_FillRule", "", 1, ruleArgs);
    Dart_SetReturnValue(args, ruleObj);
}

void CairoDart::has_current_point(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    bool hasPoint = ctx->hasCurrentPoint();
    Dart_SetReturnValue(args, Dart_NewBoolean(hasPoint));
}

void CairoDart::move_to(Dart_NativeArguments args)
{
    Arguments arg = args;
    double x = arg.doubleArg(1);
    double y = arg.doubleArg(2);
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->moveTo(x, y);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::line_to(Dart_NativeArguments args)
{
    Arguments arg = args;
    double x = arg.doubleArg(1);
    double y = arg.doubleArg(2);
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->lineTo(x, y);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::rectangle(Dart_NativeArguments args)
{
    Arguments arg = args;
    double x = arg.doubleArg(1);
    double y = arg.doubleArg(2);
    double w = arg.doubleArg(3);
    double h = arg.doubleArg(4);
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->rectangle(x, y, w, h);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::get_current_point(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    double x;
    double y;
    ctx->getCurrentPoint(&x, &y);

    Dart_Handle point = Utils::newPoint(x, y);
    Dart_SetReturnValue(args, point);
}

void CairoDart::new_path(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->newPath();
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::new_sub_path(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->newSubpath();
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::close_path(Dart_NativeArguments args)
{
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->closePath();
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::arc(Dart_NativeArguments args)
{
    Arguments arg = args;
    double xc = arg.doubleArg(1);
    double yc = arg.doubleArg(2);
    double radius = arg.doubleArg(3);
    double angle1 = arg.doubleArg(4);
    double angle2 = arg.doubleArg(5);

    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->arc(xc, yc, radius, angle1, angle2);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::arc_negative(Dart_NativeArguments args)
{
    Arguments arg = args;
    double xc = arg.doubleArg(1);
    double yc = arg.doubleArg(2);
    double radius = arg.doubleArg(3);
    double angle1 = arg.doubleArg(4);
    double angle2 = arg.doubleArg(5);

    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->negativeArc(xc, yc, radius, angle1, angle2);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::curve_to(Dart_NativeArguments args)
{
    Arguments arg = args;
    double x1 = arg.doubleArg(1);
    double y1 = arg.doubleArg(2);
    double x2 = arg.doubleArg(3);
    double y2 = arg.doubleArg(4);
    double x3 = arg.doubleArg(5);
    double y3 = arg.doubleArg(6);

    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->curveTo(x1, y1, x2, y2, x3, y3);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::rel_line_to(Dart_NativeArguments args)
{
    Arguments arg = args;
    double x = arg.doubleArg(1);
    double y = arg.doubleArg(2);
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->relLineTo(x, y);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::rel_move_to(Dart_NativeArguments args)
{
    Arguments arg = args;
    double x = arg.doubleArg(1);
    double y = arg.doubleArg(2);
    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->relMoveTo(x, y);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::rel_curve_to(Dart_NativeArguments args)
{
    Arguments arg = args;
    double x1 = arg.doubleArg(1);
    double y1 = arg.doubleArg(2);
    double x2 = arg.doubleArg(3);
    double y2 = arg.doubleArg(4);
    double x3 = arg.doubleArg(5);
    double y3 = arg.doubleArg(6);

    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->relCurveTo(x1, y1, x2, y2, x3, y3);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::text_path(Dart_NativeArguments args)
{
    Arguments arg = args;
    std::string text = arg.stringArg(1);

    Context* ctx = Utils::thisFromArg<Context>(args);
    ctx->textPath(text.c_str());

    Dart_SetReturnValue(args, Dart_Null());
}

// cairo_format_t

void CairoDart::format_stride_for_width(Dart_NativeArguments args)
{
    Arguments arg = args;
    int format = arg.intArg(1);
    int width = arg.intArg(2);

    int stride = Format::strideForWidth(static_cast<cairo_format_t>(format), width);

    Dart_SetReturnValue(args, Dart_NewInteger(stride));
}


// cairo_surface_t

void CairoDart::image_surface_create(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    int format = arg.intArg(1);
    int64_t width = arg.intArg(2);
    int64_t height = arg.intArg(3);

    ImageSurface* surface = new ImageSurface(static_cast<cairo_format_t>(format), width, height);
    Utils::setupBindingObject(obj, surface);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::image_surface_get_width(Dart_NativeArguments args)
{
    ImageSurface* surface = Utils::thisFromArg<ImageSurface>(args);
    int width = surface->width();

    Dart_SetReturnValue(args, Dart_NewInteger(width));
}

void CairoDart::image_surface_get_height(Dart_NativeArguments args)
{
    ImageSurface* surface = Utils::thisFromArg<ImageSurface>(args);
    int height = surface->height();

    Dart_SetReturnValue(args, Dart_NewInteger(height));
}

void CairoDart::image_surface_get_stride(Dart_NativeArguments args)
{
    ImageSurface* surface = Utils::thisFromArg<ImageSurface>(args);
    int stride = surface->stride();

    Dart_SetReturnValue(args, Dart_NewInteger(stride));
}

void CairoDart::surface_finish(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);
    surface->finish();
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::surface_flush(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);
    surface->flush();
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::surface_get_content(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);
    int content = surface->content();
    Dart_SetReturnValue(args, Dart_NewInteger(content));
}

void CairoDart::surface_mark_dirty(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);
    surface->markDirty();
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::surface_mark_dirty_rectangle(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);
    Arguments arg = args;
    int x = arg.intArg(1);
    int y = arg.intArg(2);
    int width = arg.intArg(3);
    int height = arg.intArg(4);

    surface->markDirtyRect(x, y, width, height);
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::surface_get_device_offset(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);
    double x;
    double y;
    surface->getDeviceOffset(x, y);

    Dart_Handle params[2] { Dart_NewDouble(x), Dart_NewDouble(y) };
    Dart_Handle obj = Utils::newObject("Point", "from", 2, params);

    Dart_SetReturnValue(args, obj);
}


void CairoDart::surface_set_device_offset(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);
    Arguments arg = args;
    double x = arg.doubleArg(1);
    double y = arg.doubleArg(2);

    surface->setDeviceOffset(x, y);

    Dart_SetReturnValue(args, Dart_Null());
}


void CairoDart::surface_copy_page(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);

    surface->copyPage();

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::surface_show_page(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);

    surface->showPage();

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::surface_supports_mime_type(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);
    Arguments arg = args;
    std::string mime = arg.stringArg(1);

    bool supports = surface->supportsMimeType(mime.c_str());
    Dart_SetReturnValue(args, Dart_NewBoolean(supports));
}


void CairoDart::surface_has_show_text_glyphs(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);

    bool res = surface->hasShowTextGlyphs();
    Dart_SetReturnValue(args, Dart_NewBoolean(res));
}

void CairoDart::surface_get_type(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);
    int type = surface->surfaceType();
    Dart_SetReturnValue(args, Dart_NewInteger(type));
}


void CairoDart::surface_get_fallback_resolution(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);
    double xRes;
    double yRes;

    surface->getFallbackResolution(xRes, yRes);

    Dart_Handle resArgs[2] = { Dart_NewDouble(xRes), Dart_NewDouble(yRes) };
    Dart_Handle resolutionObj = Utils::newObject("Resolution", "", 2, resArgs);

    Dart_SetReturnValue(args, resolutionObj);
}

void CairoDart::surface_set_fallback_resolution(Dart_NativeArguments args)
{
    Surface* surface = Utils::thisFromArg<Surface>(args);
    Arguments arg = args;
    double xRes = arg.doubleArg(1);
    double yRes = arg.doubleArg(2);

    surface->setFallbackResolution(xRes, yRes);

    Dart_SetReturnValue(args, Dart_Null());
}

// cairo_pattern_t
void CairoDart::pattern_create_rgb(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    double red = arg.doubleArg(1);
    double green = arg.doubleArg(2);
    double blue = arg.doubleArg(3);

    Pattern* pattern = Pattern::createPatternForRgb(red, green, blue);
    Utils::setupBindingObject<Pattern>(obj, pattern);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_create_rgba(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    double red = arg.doubleArg(1);
    double green = arg.doubleArg(2);
    double blue = arg.doubleArg(3);
    double alpha = arg.doubleArg(4);

    Pattern* pattern = Pattern::createPatternForRgba(red, green, blue, alpha);
    Utils::setupBindingObject<Pattern>(obj, pattern);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_create_for_surface(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    Dart_Handle surfaceObj = arg.arg(1);

    Surface* surface = Utils::bindingObject<Surface>(surfaceObj);

    Pattern* pattern = Pattern::createForSurface(surface);
    Utils::setupBindingObject<Pattern>(obj, pattern);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_create_linear(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    double x0 = arg.doubleArg(1);
    double y0 = arg.doubleArg(2);
    double x1 = arg.doubleArg(3);
    double y1 = arg.doubleArg(4);

    Pattern* pattern = Pattern::createLinear(x0, y0, x1, y1);
    Utils::setupBindingObject<Pattern>(obj, pattern);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_create_radial(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    double cx0 = arg.doubleArg(1);
    double cy0 = arg.doubleArg(2);
    double radius0 = arg.doubleArg(3);
    double cx1 = arg.doubleArg(4);
    double cy1 = arg.doubleArg(5);
    double radius1 = arg.doubleArg(6);

    Pattern* pattern = Pattern::createRadial(cx0, cy0, radius0, cx1, cy1, radius1);
    Utils::setupBindingObject<Pattern>(obj, pattern);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_create_mesh(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);

    MeshPattern* pattern = Pattern::createMesh();
    Utils::setupBindingObject<MeshPattern>(obj, pattern);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_mesh_begin_patch(Dart_NativeArguments args)
{
    MeshPattern* pattern = Utils::thisFromArg<MeshPattern>(args);
    pattern->beginPatch();

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_mesh_end_patch(Dart_NativeArguments args)
{
    MeshPattern* pattern = Utils::thisFromArg<MeshPattern>(args);
    pattern->endPatch();

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_mesh_move_to(Dart_NativeArguments args)
{
    Arguments arg = args;
    double x = arg.doubleArg(1);
    double y = arg.doubleArg(2);

    MeshPattern* pattern = Utils::thisFromArg<MeshPattern>(args);
    pattern->moveTo(x, y);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_mesh_line_to(Dart_NativeArguments args)
{
    Arguments arg = args;
    double x = arg.doubleArg(1);
    double y = arg.doubleArg(2);

    MeshPattern* pattern = Utils::thisFromArg<MeshPattern>(args);
    pattern->lineTo(x, y);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_mesh_curve_to(Dart_NativeArguments args)
{
    Arguments arg = args;
    double x1 = arg.doubleArg(1);
    double y1 = arg.doubleArg(2);
    double x2 = arg.doubleArg(3);
    double y2 = arg.doubleArg(4);
    double x3 = arg.doubleArg(5);
    double y3 = arg.doubleArg(6);

    MeshPattern* pattern = Utils::thisFromArg<MeshPattern>(args);
    pattern->curveTo(x1, y1, x2, y2, x3, y3);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_mesh_get_control_point(Dart_NativeArguments args)
{
    Arguments arg = args;
    unsigned int patchNum = (unsigned int) arg.intArg(1);
    unsigned int pointNum = (unsigned int) arg.intArg(2);

    double x = 0;
    double y = 0;

    MeshPattern* pattern = Utils::thisFromArg<MeshPattern>(args);
    pattern->getControlPoint(patchNum, pointNum, &x, &y);

    Dart_Handle pointArgs[2] = { Dart_NewDouble(x), Dart_NewDouble(y) };
    Dart_Handle point = Utils::newObject("Point", "from", 2, pointArgs);

    Dart_SetReturnValue(args, point);
}

void CairoDart::pattern_mesh_set_control_point(Dart_NativeArguments args)
{
    Arguments arg = args;
    unsigned int pointNum = (unsigned int) arg.intArg(1);
    double x = arg.doubleArg(2);
    double y = arg.doubleArg(3);

    MeshPattern* pattern = Utils::thisFromArg<MeshPattern>(args);
    pattern->setControlPoint(pointNum, x, y);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_mesh_get_corner_color(Dart_NativeArguments args)
{
    Arguments arg = args;
    unsigned int patchNum = (unsigned int) arg.intArg(1);
    unsigned int pointNum = (unsigned int) arg.intArg(2);
    double red = 0;
    double green = 0;
    double blue = 0;
    double alpha = 0;

    MeshPattern* pattern = Utils::thisFromArg<MeshPattern>(args);
    pattern->getCornerColor(patchNum, pointNum, &red, &green, &blue, &alpha);

    Dart_Handle colorArgs[4] = { Dart_NewDouble(red), Dart_NewDouble(green), Dart_NewDouble(blue), Dart_NewDouble(alpha) };
    Dart_Handle color = Utils::newObject("Color", "rgba", 4, colorArgs);

    Dart_SetReturnValue(args, color);
}

void CairoDart::pattern_mesh_set_corner_color(Dart_NativeArguments args)
{
    Arguments arg = args;
    unsigned int pointNum = (unsigned int) arg.intArg(1);
    double red = arg.doubleArg(2);
    double green = arg.doubleArg(3);
    double blue = arg.doubleArg(4);
    double alpha = arg.doubleArg(5);

    MeshPattern* pattern = Utils::thisFromArg<MeshPattern>(args);
    pattern->setCornerColor(pointNum, red, green, blue, alpha);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_mesh_get_patch_count(Dart_NativeArguments args)
{
    MeshPattern* pattern = Utils::thisFromArg<MeshPattern>(args);
    unsigned int patchCount = pattern->getPatchCount();

    Dart_SetReturnValue(args, Dart_NewInteger(patchCount));
}

void CairoDart::pattern_add_color_stop_rgb(Dart_NativeArguments args)
{
    Arguments arg = args;
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);
    double offset = arg.doubleArg(1);
    double red = arg.doubleArg(2);
    double green = arg.doubleArg(3);
    double blue = arg.doubleArg(4);

    pattern->addColorStop(offset, red, green, blue);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_add_color_stop_rgba(Dart_NativeArguments args)
{
    Arguments arg = args;
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);
    double offset = arg.doubleArg(1);
    double red = arg.doubleArg(2);
    double green = arg.doubleArg(3);
    double blue = arg.doubleArg(4);
    double alpha = arg.doubleArg(5);

    pattern->addColorStop(offset, red, green, blue, alpha);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_get_color_stop_count(Dart_NativeArguments args)
{
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);
    int count = pattern->colorStopCount();
    Dart_SetReturnValue(args, Dart_NewInteger(count));
}

void CairoDart::pattern_get_color_stop_rgba(Dart_NativeArguments args)
{
    Arguments arg = args;
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);
    int index = arg.intArg(1);
    double offset = 0.0;
    double red = 0.0;
    double green = 0.0;
    double blue = 0.0;
    double alpha = 0.0;

    pattern->getColorStop(index, &offset, &red, &green, &blue, &alpha);

    Dart_Handle colorArgs[4] = {
      Dart_NewDouble(red),
      Dart_NewDouble(green),
      Dart_NewDouble(blue),
      Dart_NewDouble(alpha)
    };
    Dart_Handle color = Utils::newObject("Color", "rgba", 4, colorArgs);

    Dart_Handle colorStopArgs[2] = { color, Dart_NewDouble(offset) };
    Dart_Handle colorStop = Utils::newObject("ColorStop", "", 2, colorStopArgs);

    Dart_SetReturnValue(args, colorStop);
}

void CairoDart::pattern_get_linear_points(Dart_NativeArguments args)
{
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);
    double x0 = 0.0;
    double y0 = 0.0;
    double x1 = 0.0;
    double y1 = 0.0;

    pattern->getLinearPoints(&x0, &y0, &x1, &y1);

    Dart_Handle point1 = Utils::newPoint(x0, y0);
    Dart_Handle point2 = Utils::newPoint(x1, y1);
    Dart_Handle res = Utils::newList(2, point1, point2);

    Dart_SetReturnValue(args, res);
}

void CairoDart::pattern_get_radial_circles(Dart_NativeArguments args)
{
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);
    double x0 = 0.0;
    double y0 = 0.0;
    double r0 = 0.0;
    double x1 = 0.0;
    double y1 = 0.0;
    double r1 = 0.0;

    pattern->getRadialCircles(&x0, &y0, &r0, &x1, &y1, &r1);

    Dart_Handle circle1 = Utils::newCircle(x0, y0, r0);
    Dart_Handle circle2 = Utils::newCircle(x1, y1, r1);
    Dart_Handle res = Utils::newList(2, circle1, circle2);

    Dart_SetReturnValue(args, res);
}


void CairoDart::pattern_get_extend(Dart_NativeArguments args)
{
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);

    cairo_extend_t extend = pattern->getExtend();
    int val = static_cast<int>(extend);
    Dart_SetReturnValue(args, Dart_NewInteger(val));
}

void CairoDart::pattern_set_extend(Dart_NativeArguments args)
{
    Arguments arg = args;
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);
    int val = arg.intArg(1);

    pattern->setExtend(static_cast<cairo_extend_t>(val));

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_get_filter(Dart_NativeArguments args)
{
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);

    cairo_filter_t filter = pattern->getFilter();
    int val = static_cast<int>(filter);
    Dart_SetReturnValue(args, Dart_NewInteger(val));
}

void CairoDart::pattern_set_filter(Dart_NativeArguments args)
{
    Arguments arg = args;
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);
    int val = arg.intArg(1);

    pattern->setFilter(static_cast<cairo_filter_t>(val));

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::pattern_get_type(Dart_NativeArguments args)
{
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);
    cairo_pattern_type_t type = pattern->getPatternType();

    Dart_SetReturnValue(args, Dart_NewInteger(static_cast<int>(type)));
}

void CairoDart::pattern_get_matrix(Dart_NativeArguments args)
{
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);
    Matrix* matrix = pattern->getMatrix();
    Dart_Handle matrixObj = Utils::newObject("_Matrix", "internal", 0, NULL);
    Utils::setupBindingObject<Matrix>(matrixObj, matrix);
    Dart_SetReturnValue(args, matrixObj);
}

void CairoDart::pattern_set_matrix(Dart_NativeArguments args)
{
    Arguments arg = args;
    Pattern* pattern = Utils::thisFromArg<Pattern>(args);
    Dart_Handle matrixObj = arg.arg(1);
    Matrix* matrix = Utils::bindingObject<Matrix>(matrixObj);
    pattern->setMatrix(matrix);

    Dart_SetReturnValue(args, Dart_Null());
}

// cairo_matrix_t

void CairoDart::matrix_create(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);

    cairo_matrix_t* m = new cairo_matrix_t;
    Matrix* matrix = new Matrix(m);

    Utils::setupBindingObject<Matrix>(obj, matrix);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::matrix_xx(Dart_NativeArguments args)
{
    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->xx()));
}

void CairoDart::matrix_yx(Dart_NativeArguments args)
{
    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->yx()));
}

void CairoDart::matrix_xy(Dart_NativeArguments args)
{
    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->xy()));
}

void CairoDart::matrix_yy(Dart_NativeArguments args)
{
    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->yy()));
}

void CairoDart::matrix_x0(Dart_NativeArguments args)
{
    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->x0()));
}

void CairoDart::matrix_y0(Dart_NativeArguments args)
{
    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    Dart_SetReturnValue(args, Dart_NewDouble(matrix->y0()));
}

void CairoDart::matrix_init(Dart_NativeArguments args)
{
    Arguments arg = args;
    double xx = arg.doubleArg(1);
    double yx = arg.doubleArg(2);
    double xy = arg.doubleArg(3);
    double yy = arg.doubleArg(4);
    double x0 = arg.doubleArg(5);
    double y0 = arg.doubleArg(6);

    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    matrix->init(xx, yx, xy, yy, x0, y0);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::matrix_init_identity(Dart_NativeArguments args)
{
    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    matrix->initIdentify();
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::matrix_init_translate(Dart_NativeArguments args)
{
    Arguments arg = args;
    double tx = arg.doubleArg(1);
    double ty = arg.doubleArg(2);

    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    matrix->initTranslate(tx, ty);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::matrix_init_scale(Dart_NativeArguments args)
{
    Arguments arg = args;
    double sx = arg.doubleArg(1);
    double sy = arg.doubleArg(2);

    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    matrix->initScale(sx, sy);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::matrix_init_rotate(Dart_NativeArguments args)
{
    Arguments arg = args;
    double radians = arg.doubleArg(1);

    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    matrix->initRotate(radians);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::matrix_translate(Dart_NativeArguments args)
{
    Arguments arg = args;
    double tx = arg.doubleArg(1);
    double ty = arg.doubleArg(2);

    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    matrix->translate(tx, ty);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::matrix_scale(Dart_NativeArguments args)
{
    Arguments arg = args;
    double sx = arg.doubleArg(1);
    double sy = arg.doubleArg(2);

    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    matrix->scale(sx, sy);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::matrix_rotate(Dart_NativeArguments args)
{
    Arguments arg = args;
    double radians = arg.doubleArg(1);

    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    matrix->rotate(radians);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::matrix_invert(Dart_NativeArguments args)
{
    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    matrix->invert();
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::matrix_transform_point(Dart_NativeArguments args)
{
    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    double x = 0.0;
    double y = 0.0;

    matrix->getTransformPoint(&x, &y);

    Dart_Handle pointObj = Utils::newPoint(x, y);

    Dart_SetReturnValue(args, pointObj);
}

void CairoDart::matrix_transform_distance(Dart_NativeArguments args)
{
    Matrix* matrix = Utils::thisFromArg<Matrix>(args);
    double dx = 0.0;
    double dy = 0.0;

    matrix->getTransformDistance(&dx, &dy);

    Dart_Handle distanceObj = Utils::newDistance(dx, dy);

    Dart_SetReturnValue(args, distanceObj);
}

void CairoDart::matrix_multiply(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle matrix1Obj = arg.arg(0);
    Dart_Handle matrix2Obj = arg.arg(1);

    Matrix* m1 = Utils::bindingObject<Matrix>(matrix1Obj);
    Matrix* m2 = Utils::bindingObject<Matrix>(matrix2Obj);

    Matrix* result = Matrix::multiply(m1, m2);

    Dart_Handle resultObj = Utils::newObject("_Matrix", "internal", 0, NULL);

    Utils::setupBindingObject<Matrix>(resultObj, result);

    Dart_SetReturnValue(args, resultObj);
}

// cairo_region_t

void CairoDart::region_create(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);

    cairo_region_t* reg = cairo_region_create();
    Region* region = new Region(reg);

    Utils::setupBindingObject<Region>(obj, region);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::region_create_rectangle(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    int x = arg.intArg(1);
    int y = arg.intArg(2);
    int width = arg.intArg(3);
    int height = arg.intArg(4);

    cairo_rectangle_int_t rect;
    rect.x = x;
    rect.y = y;
    rect.width = width;
    rect.height = height;

    cairo_region_t* reg = cairo_region_create_rectangle(&rect);

    Region* region = new Region(reg);

    Utils::setupBindingObject<Region>(obj, region);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::region_create_rectangles(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    Dart_Handle areas = arg.arg(1);

    int length = Utils::listLength(areas);

    std::vector<cairo_rectangle_int_t> rectangles;

    for (int i = 0; i < length; i += 4)
    {
        cairo_rectangle_int_t rect;
        rect.x = Utils::intAt(areas, i);
        rect.y = Utils::intAt(areas, i + 1);
        rect.width = Utils::intAt(areas, i + 2);
        rect.height = Utils::intAt(areas, i + 3);
        rectangles.push_back(rect);
    }

    cairo_region_t* reg = cairo_region_create_rectangles(&rectangles[0], rectangles.size());

    Region* region = new Region(reg);

    Utils::setupBindingObject<Region>(obj, region);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::region_copy(Dart_NativeArguments args)
{
    Region* region = Utils::thisFromArg<Region>(args);
    Region* copy = region->copy();

    Dart_Handle copyObj = Utils::newObject("Region", "_internal", 0, NULL);
    Utils::setupBindingObject<Region>(copyObj, copy);
    Dart_SetReturnValue(args, copyObj);
}

void CairoDart::region_get_extents(Dart_NativeArguments args)
{
    Region* region = Utils::thisFromArg<Region>(args);
    cairo_rectangle_int_t extents = region->getExtents();

    Dart_Handle rect = Utils::newRectangle(extents.x, extents.y, extents.width, extents.height);
    Dart_SetReturnValue(args, rect);
}

void CairoDart::region_get_num_rectangles(Dart_NativeArguments args)
{
    Region* region = Utils::thisFromArg<Region>(args);
    int num = region->getNumRectangles();
    Dart_SetReturnValue(args, Dart_NewInteger(num));
}

void CairoDart::region_get_rectangle(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    int nth = arg.intArg(1);
    cairo_rectangle_int_t rect = region->getRectangle(nth);
    Dart_Handle res = Utils::newRectangle(rect.x, rect.y, rect.width, rect.height);
    Dart_SetReturnValue(args, res);
}

void CairoDart::region_is_empty(Dart_NativeArguments args)
{
    Region* region = Utils::thisFromArg<Region>(args);
    bool isEmpty = region->isEmpty();
    Dart_SetReturnValue(args, Dart_NewBoolean(isEmpty));
}

void CairoDart::region_contains_point(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    int x = arg.intArg(1);
    int y = arg.intArg(2);
    bool res = region->containsPoint(x, y);
    Dart_SetReturnValue(args, Dart_NewBoolean(res));
}

void CairoDart::region_contains_rectangle(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    int x = arg.intArg(1);
    int y = arg.intArg(2);
    int width = arg.intArg(3);
    int height = arg.intArg(4);
    cairo_region_overlap_t overlap = region->containsRectangle(x, y, width, height);

    Dart_Handle overlapArgs[] = { Dart_NewInteger(static_cast<int>(overlap)) };
    Dart_Handle overlapObj = Utils::newObject("_RegionOverlap", "", 1, overlapArgs);
    Dart_SetReturnValue(args, overlapObj);
}

void CairoDart::region_equal(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    Dart_Handle otherObj = arg.arg(1);
    Region* other = Utils::bindingObject<Region>(otherObj);
    bool equal = *region == *other;
    Dart_SetReturnValue(args, Dart_NewBoolean(equal));
}

void CairoDart::region_translate(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    int dx = arg.intArg(1);
    int dy = arg.intArg(2);

    region->translate(dx, dy);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::region_intersect(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    Dart_Handle otherObj = arg.arg(1);
    Region* other = Utils::bindingObject<Region>(otherObj);

    region->intersect(other);
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::region_intersect_rectangle(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    int x = arg.intArg(1);
    int y = arg.intArg(2);
    int width = arg.intArg(3);
    int height = arg.intArg(4);

    region->intersectRectangle(x, y, width, height);
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::region_subtract(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    Dart_Handle otherObj = arg.arg(1);
    Region* other = Utils::bindingObject<Region>(otherObj);

    region->subtract(other);
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::region_subtract_rectangle(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    int x = arg.intArg(1);
    int y = arg.intArg(2);
    int width = arg.intArg(3);
    int height = arg.intArg(4);

    region->subtractRectangle(x, y, width, height);
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::region_union(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    Dart_Handle otherObj = arg.arg(1);
    Region* other = Utils::bindingObject<Region>(otherObj);

    region->doUnion(other);
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::region_union_rectangle(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    int x = arg.intArg(1);
    int y = arg.intArg(2);
    int width = arg.intArg(3);
    int height = arg.intArg(4);

    region->unionRectangle(x, y, width, height);
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::region_xor(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    Dart_Handle otherObj = arg.arg(1);
    Region* other = Utils::bindingObject<Region>(otherObj);

    region->doXor(other);
    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::region_xor_rectangle(Dart_NativeArguments args)
{
    Arguments arg = args;
    Region* region = Utils::thisFromArg<Region>(args);
    int x = arg.intArg(1);
    int y = arg.intArg(2);
    int width = arg.intArg(3);
    int height = arg.intArg(4);

    region->xorRectangle(x, y, width, height);
    Dart_SetReturnValue(args, Dart_Null());
}


} // bindings

} // cairodart
