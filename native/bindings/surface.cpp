#include "infrastructure/utils.h"
#include "surface.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

Surface::Surface()
{
}

Surface::~Surface()
{
    if (this->surface)
    {
        cairo_surface_destroy(this->surface);
        verify();
        this->surface = nullptr;
    }
}

void Surface::verify() const
{
    cairo_status_t status = cairo_surface_status(surface);
    Utils::verify(status);
}

} // bindings

} // cairodart
