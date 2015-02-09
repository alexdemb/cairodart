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

void Surface::setDeviceOffset(const double& x, const double& y) const
{
    cairo_surface_set_device_offset(this->surface, x, y);
    verify();
}


void Surface::getDeviceOffset(double& x, double& y) const
{
    cairo_surface_get_device_offset(this->surface, &x, &y);
    verify();
}

void Surface::copyPage() const
{
    cairo_surface_copy_page(this->surface);
    verify();
}

void Surface::showPage() const
{
    cairo_surface_show_page(this->surface);
    verify();
}

bool Surface::hasShowTextGlyphs() const
{
    cairo_bool_t res = cairo_surface_has_show_text_glyphs(this->surface);
    verify();
    return res != 0;
}

bool Surface::supportsMimeType(const char* mimeType) const
{
    cairo_bool_t res = cairo_surface_supports_mime_type(this->surface, mimeType);
    verify();
    return res != 0;
}

int Surface::surfaceType() const
{
    cairo_surface_type_t type = cairo_surface_get_type(this->surface);
    verify();
    return static_cast<int>(type);
}

void Surface::setFallbackResolution(const double& xRes, const double& yRes) const
{
    cairo_surface_set_fallback_resolution(this->surface, xRes, yRes);
    verify();
}

void Surface::getFallbackResolution(double& xRes, double& yRes) const
{
    cairo_surface_get_fallback_resolution(this->surface, &xRes, &yRes);
    verify();
}

cairo_surface_t* Surface::getHandle() const
{
    return this->surface;
}

} // bindings

} // cairodart
