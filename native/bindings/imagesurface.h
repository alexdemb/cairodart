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
};

} // bindings

} // cairodart


#endif // IMAGESURFACE_H
