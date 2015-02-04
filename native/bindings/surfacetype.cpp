#include "surfacetype.h"

namespace cairodart
{

namespace bindings
{

SurfaceType::SurfaceType(cairo_surface_type_t st)
{
    this->st = st;
}

SurfaceType::~SurfaceType()
{

}

cairo_surface_type_t SurfaceType::surfaceType() const
{
    return st;
}

} // bindings

} // cairodart
