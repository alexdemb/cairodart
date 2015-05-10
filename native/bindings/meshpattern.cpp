#include "meshpattern.h"
#include "infrastructure/infrastructure.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

MeshPattern* MeshPattern::createMesh(cairo_pattern_t *p)
{
    MeshPattern* mp = new MeshPattern(p);
    BindingObjectCache::getInstance()->add(p, mp);
    return mp;
}

MeshPattern::MeshPattern(cairo_pattern_t* p) : Pattern(p)
{
}

MeshPattern::~MeshPattern()
{
}

void MeshPattern::beginPatch() const
{
    cairo_mesh_pattern_begin_patch(this->pattern);
    verify();
}

void MeshPattern::endPatch() const
{
    cairo_mesh_pattern_end_patch(this->pattern);
    verify();
}

void MeshPattern::moveTo(const double& x, const double& y) const
{
    cairo_mesh_pattern_move_to(this->pattern, x, y);
    verify();
}

void MeshPattern::lineTo(const double& x, const double& y) const
{
    cairo_mesh_pattern_line_to(this->pattern, x, y);
    verify();
}

void MeshPattern::curveTo(const double& x1, const double& y1, const double& x2, const double& y2, const double& x3, const double& y3) const
{
    cairo_mesh_pattern_curve_to(this->pattern, x1, y1, x2, y2, x3, y3);
    verify();
}

void MeshPattern::setControlPoint(const unsigned int& pointNum, const double& x, const double& y) const
{
    cairo_mesh_pattern_set_control_point(this->pattern, pointNum, x, y);
    verify();
}

void MeshPattern::getControlPoint(const unsigned int& patchNum, const unsigned int& pointNum, double* x, double* y) const
{
    cairo_mesh_pattern_get_control_point(this->pattern, patchNum, pointNum, x, y);
    verify();
}

void MeshPattern::setCornerColor(const unsigned int& pointNum, const double& red, const double& green, const double& blue) const
{
    cairo_mesh_pattern_set_corner_color_rgb(this->pattern, pointNum, red, green, blue);
    verify();
}

void MeshPattern::setCornerColor(const unsigned int& pointNum, const double& red, const double& green, const double& blue, const double& alpha) const
{
    cairo_mesh_pattern_set_corner_color_rgba(this->pattern, pointNum, red, green, blue, alpha);
    verify();
}

unsigned int MeshPattern::getPatchCount() const
{
    unsigned int count;
    cairo_mesh_pattern_get_patch_count(this->pattern, &count);
    verify();
    return count;
}

void MeshPattern::getCornerColor(const unsigned int& patchNum, const unsigned int& cornerNum, double* red, double* green, double* blue, double* alpha) const
{
    cairo_mesh_pattern_get_corner_color_rgba(this->pattern, patchNum, cornerNum, red, green, blue, alpha);
    verify();
}



} // bindings

} // cairodart
