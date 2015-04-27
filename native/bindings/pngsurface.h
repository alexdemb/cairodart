#ifndef PNGSURFACE_H
#define PNGSURFACE_H

#include "surface.h"

namespace cairodart
{

namespace bindings
{

class PngSurface : public Surface
{
public:
    PngSurface(const char* fileName);
    ~PngSurface();

    void writeTo(const char* fileName);
};

} // bindings

} // cairodart

#endif // PNGSURFACE_H
