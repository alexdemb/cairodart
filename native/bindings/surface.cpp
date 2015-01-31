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

void Surface::finish() const
{
    cairo_surface_finish(this->surface);
    verify();
}

void Surface::flush() const
{
    cairo_surface_flush(this->surface);
    verify();
}

int Surface::content() const
{
    cairo_content_t content = cairo_surface_get_content(this->surface);
    verify();
    return static_cast<int>(content);
}

void Surface::markDirty() const
{
    cairo_surface_mark_dirty(this->surface);
    verify();
}

void Surface::markDirtyRect(const int &x, const int &y, const int &width, const int &height) const
{
    cairo_surface_mark_dirty_rectangle(this->surface, x, y, width, height);
    verify();
}

} // bindings

} // cairodart
