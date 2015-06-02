#include "pattern.h"
#include "meshpattern.h"
#include <cairo/cairo.h>
#include <infrastructure/infrastructure.h>

using namespace cairodart::infrastructure;

namespace cairodart
{


namespace bindings
{

Pattern* Pattern::create(cairo_pattern_t *p)
{
    Pattern* pattern = new Pattern(p);
    BindingObjectCache::getInstance()->add(p, pattern);
    return pattern;
}

Pattern* Pattern::getOrCreate(cairo_pattern_t *p)
{
    Pattern* pattern = nullptr;
    if (BindingObjectCache::getInstance()->has(p))
    {
        pattern = (Pattern*) BindingObjectCache::getInstance()->get(p);
    }
    else
    {
        pattern = Pattern::create(p);
    }

    return pattern;
}

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
    return create(p);
}

Pattern* Pattern::createPatternForRgba(const double& red, const double& green, const double& blue, const double& alpha)
{
    cairo_pattern_t* p = cairo_pattern_create_rgba(red, green, blue, alpha);
    return create(p);
}

Pattern* Pattern::createForSurface(const Surface* surface)
{
    cairo_pattern_t* p = cairo_pattern_create_for_surface(surface->getHandle());
    return create(p);
}

Pattern* Pattern::createLinear(const double& x0, const double& y0, const double& x1, const double& y1)
{
    cairo_pattern_t* p = cairo_pattern_create_linear(x0, y0, x1, y1);
    return create(p);
}

Pattern* Pattern::createRadial(const double& cx0, const double& cy0, const double& radius0, const double& cx1, const double& cy1, const double& radius1)
{
    cairo_pattern_t* p = cairo_pattern_create_radial(cx0, cy0, radius0, cx1, cy1, radius1);
    return create(p);
}

MeshPattern* Pattern::createMesh()
{
    cairo_pattern_t* p = cairo_pattern_create_mesh();
    return MeshPattern::createMesh(p);
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

void Pattern::getLinearPoints(double* x0, double* y0, double* x1, double* y1) const
{
    cairo_pattern_get_linear_points(this->pattern, x0, y0, x1, y1);
    verify();
}

void Pattern::getRadialCircles(double* cx0, double* cy0, double* r0, double* cx1, double* cy1, double* r1) const
{
    cairo_pattern_get_radial_circles(this->pattern, cx0, cy0, r0, cx1, cy1, r1);
    verify();
}

cairo_extend_t Pattern::getExtend() const
{
    cairo_extend_t extend = cairo_pattern_get_extend(this->pattern);
    verify();
    return extend;
}

void Pattern::setExtend(const cairo_extend_t& extend) const
{
    cairo_pattern_set_extend(this->pattern, extend);
    verify();
}

cairo_filter_t Pattern::getFilter() const
{
    cairo_filter_t filter = cairo_pattern_get_filter(this->pattern);
    verify();
    return filter;
}

void Pattern::setFilter(const cairo_filter_t& filter) const
{
    cairo_pattern_set_filter(this->pattern, filter);
    verify();
}

cairo_pattern_type_t Pattern::getPatternType() const
{
    cairo_pattern_type_t type = cairo_pattern_get_type(this->pattern);
    verify();
    return type;
}



cairo_pattern_t* Pattern::getHandle() const
{
    return this->pattern;
}

bool Pattern::operator ==(const Pattern& other)
{
    return this->getHandle() == other.getHandle();
}

} // bindings

} // cairodart
