#include "imagesurface.h"

namespace cairodart
{

namespace bindings
{

ImageSurface::ImageSurface(cairo_format_t& format, int width, int height)
{
    this->surface = cairo_image_surface_create(format, width, height);
    verify();
}

ImageSurface::~ImageSurface()
{
}

} // bindings

} // cairodart
