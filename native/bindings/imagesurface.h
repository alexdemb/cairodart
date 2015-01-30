#ifndef IMAGESURFACE_H
#define IMAGESURFACE_H

#include "surface.h"

namespace cairodart
{

namespace bindings
{

class ImageSurface final : public Surface
{
public:
    ImageSurface(cairo_format_t& format, int width, int height);
    virtual ~ImageSurface();

    int width() const;
    int height() const;
};

} // bindings

} // cairodart


#endif // IMAGESURFACE_H
