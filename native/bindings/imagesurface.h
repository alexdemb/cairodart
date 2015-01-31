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
    ImageSurface(Format* format, int width, int height);
    virtual ~ImageSurface();

    int width() const;
    int height() const;
};

} // bindings

} // cairodart


#endif // IMAGESURFACE_H
