#include "imagesurface.h"
#include "infrastructure/infrastructure.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

ImageSurface* ImageSurface::create(const cairo_format_t &format, int width, int height)
{
    ImageSurface* surface = new ImageSurface(format, width, height);
    BindingObjectCache::getInstance()->add(surface->getHandle(), surface);
    return surface;
}

ImageSurface::ImageSurface(const cairo_format_t& format, int width, int height)
{
    this->surface = cairo_image_surface_create(format, width, height);
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

int ImageSurface::stride() const
{
    int stride = cairo_image_surface_get_stride(this->surface);
    verify();
    return stride;
}

} // bindings

} // cairodart
