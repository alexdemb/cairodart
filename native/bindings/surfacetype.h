#ifndef SURFACETYPE_H
#define SURFACETYPE_H

#include <cairo/cairo.h>

namespace cairodart
{

namespace bindings
{

class SurfaceType final
{
private:
    cairo_surface_type_t st;
public:
    SurfaceType(cairo_surface_type_t surfaceType);
    ~SurfaceType();

    cairo_surface_type_t surfaceType() const;

};

} // bindings

} // cairodart

#endif // SURFACETYPE_H
