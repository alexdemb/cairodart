#ifndef SURFACE_H
#define SURFACE_H

#include <cairo/cairo.h>
#include "dart_api.h"
#include "cairoobject.h"

namespace cairodart
{

namespace bindings
{

class Surface : public CairoObject
{
protected:
    cairo_surface_t* surface;
    Surface();
public:
    virtual ~Surface();
    static cairo_format_t cairoFormatFromHandle(const Dart_Handle& formatHandle);

    void verify() const;
};

} // bindings

} // cairodart

#endif // SURFACE_H
