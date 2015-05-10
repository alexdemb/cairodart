#include "pngsurface.h"

#include <cairo/cairo.h>
#include "infrastructure/infrastructure.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

PngSurface* PngSurface::create(const char *fileName)
{
    PngSurface* surface = new PngSurface(fileName);
    BindingObjectCache::getInstance()->add(surface->getHandle(), surface);
    return surface;
}

PngSurface::PngSurface(const char* fileName)
{
    this->surface = cairo_image_surface_create_from_png(fileName);
}

PngSurface::~PngSurface()
{
}

void PngSurface::writeTo(const char *fileName)
{
    cairo_surface_write_to_png(this->surface, fileName);
    verify();
}

} // bindings

} // cairodart
