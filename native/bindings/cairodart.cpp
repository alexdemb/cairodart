#include <map>
#include <cairo/cairo.h>
#include <cstdint>

#include "cairodart.h"
#include "infrastructure/infrastructure.h"
#include "surface.h"
#include "imagesurface.h"
#include "content.h"
#include "surfacetype.h"
#include "context.h"
#include "pattern.h"
#include "meshpattern.h"

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
  { "image_surface_create", CairoDart::image_surface_create },
  { "image_surface_get_width", CairoDart::image_surface_get_width },
  { "image_surface_get_height", CairoDart::image_surface_get_height },
  { "create_cairo_format", CairoDart::create_cairo_format },
  { "create_cairo_content", CairoDart::create_cairo_content },
  { "create_cairo_surface_type", CairoDart::create_cairo_surface_type },
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
  { "pattern_get_color_stop_rgba", CairoDart::pattern_get_color_stop_rgba }

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
    Dart_Handle contentObj = arg.arg(1);
    Content* content = Utils::bindingObject<Content>(contentObj);

    Context* ctx = Utils::thisFromArg<Context>(args);

    ctx->pushGroupWithContent(content);

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


// cairo_format_t

void CairoDart::create_cairo_format(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    int val = arg.intArg(1);

    cairo_format_t fmt = static_cast<cairo_format_t>(val);

    Format* format = new Format(fmt);
    Utils::setupBindingObject(obj, format);

    Dart_SetReturnValue(args, Dart_Null());
}

void CairoDart::format_stride_for_width(Dart_NativeArguments args)
{
    Arguments arg = args;
    int width = arg.intArg(1);

    Format* format = Utils::thisFromArg<Format>(args);
    int stride = format->strideForWidth(width);

    Dart_SetReturnValue(args, Dart_NewInteger(stride));
}

// cairo_surface_type_t

void CairoDart::create_cairo_surface_type(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    int val = arg.intArg(1);

    cairo_surface_type_t type = static_cast<cairo_surface_type_t>(val);

    SurfaceType* st = new SurfaceType(type);
    Utils::setupBindingObject<SurfaceType>(obj, st);

    Dart_SetReturnValue(args, Dart_Null());
}

// cairo_content_t

void CairoDart::create_cairo_content(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    int val = arg.intArg(1);

    cairo_content_t cnt = static_cast<cairo_content_t>(val);
    Content* content = new Content(cnt);
    Utils::setupBindingObject(obj, content);

    Dart_SetReturnValue(args, Dart_Null());
}

// cairo_surface_t

void CairoDart::image_surface_create(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    Dart_Handle formatHandle = arg.arg(1);
    int64_t width = arg.intArg(2);
    int64_t height = arg.intArg(3);

    Format* format = Utils::bindingObject<Format>(formatHandle);

    ImageSurface* surface = new ImageSurface(format, width, height);
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


} // bindings

} // cairodart
