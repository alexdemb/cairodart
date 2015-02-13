#include "pattern.h"
#include "meshpattern.h"
#include <cairo/cairo.h>
#include <infrastructure/infrastructure.h>

using namespace cairodart::infrastructure;

namespace cairodart
{


namespace bindings
{

Pattern::Pattern(cairo_pattern_t* pattern)
{
    this->pattern = pattern;
}

Pattern::~Pattern()
{
    if (this->pattern)
    {
        cairo_pattern_destroy(this->pattern);
        this->pattern = nullptr;
    }
}

void Pattern::verify() const
{
    if (this->pattern)
    {
        cairo_status_t status = cairo_pattern_status(this->pattern);
        Utils::verify(status);
    }
}

Pattern* Pattern::createPatternForRgb(const double& red, const double& green, const double& blue)
{
    cairo_pattern_t* p = cairo_pattern_create_rgb(red, green, blue);
    return new Pattern(p);
}

Pattern* Pattern::createPatternForRgba(const double& red, const double& green, const double& blue, const double& alpha)
{
    cairo_pattern_t* p = cairo_pattern_create_rgba(red, green, blue, alpha);
    return new Pattern(p);
}

Pattern* Pattern::createForSurface(const Surface* surface)
{
    cairo_pattern_t* p = cairo_pattern_create_for_surface(surface->getHandle());
    return new Pattern(p);
}

Pattern* Pattern::createLinear(const double& x0, const double& y0, const double& x1, const double& y1)
{
    cairo_pattern_t* p = cairo_pattern_create_linear(x0, y0, x1, y1);
    return new Pattern(p);
}

Pattern* Pattern::createRadial(const double& cx0, const double& cy0, const double& radius0, const double& cx1, const double& cy1, const double& radius1)
{
    cairo_pattern_t* p = cairo_pattern_create_radial(cx0, cy0, radius0, cx1, cy1, radius1);
    return new Pattern(p);
}

MeshPattern* Pattern::createMesh()
{
    cairo_pattern_t* p = cairo_pattern_create_mesh();
    return new MeshPattern(p);
}

void Pattern::addColorStop(const double& offset, const double& red, const double& green, const double& blue) const
{
    cairo_pattern_add_color_stop_rgb(this->pattern, offset, red, green, blue);
    verify();
}

void Pattern::addColorStop(const double& offset, const double& red, const double& green, const double& blue, const double& alpha) const
{
    cairo_pattern_add_color_stop_rgba(this->pattern, offset, red, green, blue, alpha);
    verify();
}

int Pattern::colorStopCount() const
{
    int count;
    cairo_pattern_get_color_stop_count(this->pattern, &count);
    return count;
}

void Pattern::getColorStop(const int& index, double* offset, double* red, double* green, double* blue, double* alpha) const
{
    cairo_pattern_get_color_stop_rgba(this->pattern, index, offset, red, green, blue, alpha);
    verify();
}


} // bindings

} // cairodart
