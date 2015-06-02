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
    static ImageSurface* create(const cairo_format_t& format, int width, int height);
    static ImageSurface* create(const char* fileName);

    ImageSurface(const cairo_format_t& format, int width, int height);
    ImageSurface(const char* fileName);
    virtual ~ImageSurface();

    int width() const;
    int height() const;
    int stride() const;

    void writeTo(const char* fileName);
};

} // bindings

} // cairodart


#endif // IMAGESURFACE_H
