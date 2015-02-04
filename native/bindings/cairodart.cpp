#include <map>
#include <cairo/cairo.h>
#include <cstdint>

#include "cairodart.h"
#include "infrastructure/infrastructure.h"
#include "surface.h"
#include "imagesurface.h"
#include "content.h"
#include "surfacetype.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

static std::map<std::string, Dart_NativeFunction> FUNCTIONS_MAP =
{
  { "createContext", CairoDart::createContext },
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
  { "surface_get_type", CairoDart::surface_get_type }
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

void CairoDart::createContext(Dart_NativeArguments args)
{
    UNUSED(args) //temporary
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

} // bindings

} // cairodart
