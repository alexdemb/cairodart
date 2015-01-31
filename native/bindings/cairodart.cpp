#include <map>
#include <cairo/cairo.h>
#include <cstdint>

#include "cairodart.h"
#include "infrastructure/infrastructure.h"
#include "surface.h"
#include "imagesurface.h"
#include "content.h"

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
  { "format_stride_for_width", CairoDart::format_stride_for_width },
  { "image_surface_get_stride", CairoDart::image_surface_get_stride }
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

} // bindings

} // cairodart
