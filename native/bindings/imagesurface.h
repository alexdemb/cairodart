#ifndef IMAGESURFACE_H
#define IMAGESURFACE_H

#include "surface.h"
#include "format.h"

namespace cairodart
{

namespace bindings
{

class ImageSurface final : public Surface
{
public:
    static ImageSurface* create(const cairo_format_t& format, int width, int height);

    ImageSurface(const cairo_format_t& format, int width, int height);
    virtual ~ImageSurface();

    int width() const;
    int height() const;
    int stride() const;
};

} // bindings

} // cairodart


#endif // IMAGESURFACE_H
