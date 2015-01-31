#include "imagesurface.h"

namespace cairodart
{

namespace bindings
{

ImageSurface::ImageSurface(Format* format, int width, int height)
{
    this->surface = cairo_image_surface_create(format->format(), width, height);
    verify();
}

ImageSurface::~ImageSurface()
{
}

int ImageSurface::width() const
{
    int width = cairo_image_surface_get_width(this->surface);
    verify();
    return width;
}

int ImageSurface::height() const
{
    int height = cairo_image_surface_get_height(this->surface);
    verify();
    return height;
}

} // bindings

} // cairodart
