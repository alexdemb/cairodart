#ifndef CAIRODART_H
#define CAIRODART_H

#include "dart_api.h"
#include "infrastructure/infrastructure.h"
#include "cairo/cairo.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

class CairoDart
{
public:
    static Dart_NativeFunction resolve(std::string& name);

    static void createContext(Dart_NativeArguments args);
    static void image_surface_create(Dart_NativeArguments args);
private:
    CairoDart();

    static cairo_format_t getCairoFormatFromHandle(const Dart_Handle& formatHandle);
};

} // bindings

} // cairodart

#endif // CAIRODART_H
