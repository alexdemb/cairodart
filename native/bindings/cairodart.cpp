#include "cairodart.h"
#include "infrastructure/infrastructure.h"
#include <map>
#include <cairo/cairo.h>
#include <cstdint>


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
    Dart_Handle formatHandle = arg.arg(1);
    int64_t width = arg.intArg(2);
    int64_t height = arg.intArg(3);

    cairo_format_t format = getCairoFormatFromHandle(formatHandle);

    cairo_surface_t* surface = cairo_image_surface_create(format, width, height);

    // TODO: Dart_NewWeakPersistentHandle() should be used and callback for releasing surface should be assigned.

    Dart_SetNativeInstanceField(obj, 0, (intptr_t) surface);

    Dart_SetReturnValue(args, Dart_Null());
}

cairo_format_t CairoDart::getCairoFormatFromHandle(const Dart_Handle& formatHandle)
{
    int64_t val = Utils::toInteger(Utils::getField(formatHandle, "value"));
    cairo_format_t result = static_cast<cairo_format_t>(val);
    return result;
}


} // bindings

} // cairodart
