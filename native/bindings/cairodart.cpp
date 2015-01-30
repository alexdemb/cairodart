#include <map>
#include <cairo/cairo.h>
#include <cstdint>

#include "cairodart.h"
#include "infrastructure/infrastructure.h"
#include "surface.h"
#include "imagesurface.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

static std::map<std::string, Dart_NativeFunction> FUNCTIONS_MAP =
{
  { "createContext", CairoDart::createContext },
  { "image_surface_create", CairoDart::image_surface_create }
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

void CairoDart::image_surface_create(Dart_NativeArguments args)
{
    Arguments arg = args;
    Dart_Handle obj = arg.arg(0);
    cairo_format_t format = Surface::cairoFormatFromHandle(arg.arg(1));
    int64_t width = arg.intArg(2);
    int64_t height = arg.intArg(3);

    ImageSurface* surface = new ImageSurface(format, width, height);
    Utils::setupBindingObject(obj, surface);

    Dart_SetReturnValue(args, Dart_Null());
}



} // bindings

} // cairodart
