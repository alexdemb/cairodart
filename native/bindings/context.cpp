#include "context.h"
#include "infrastructure/infrastructure.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

Context::Context(Surface* surface)
{
    cairo_t* handle = cairo_create(surface->getHandle());
    this->c = handle;
}

Context::~Context()
{
    if (this->c)
    {
        cairo_destroy(this->c);
        c = nullptr;
    }
}

void Context::verify() const
{
    cairo_status_t status = cairo_status(this->c);
    Utils::verify(status);
}

void Context::save() const
{
    cairo_save(this->c);
    verify();
}

void Context::restore() const
{
    cairo_restore(this->c);
    verify();
}

void Context::pushGroup() const
{
    cairo_push_group(this->c);
    verify();
}

void Context::pushGroupWithContent(const cairo_content_t& c) const
{
    cairo_push_group_with_content(this->c, c);
    verify();
}

void Context::popGroupToSource() const
{
    cairo_pop_group_to_source(this->c);
    verify();
}

void Context::setSourceRgb(double& red, double& green, double& blue) const
{
    cairo_set_source_rgb(this->c, red, green, blue);
    verify();
}

void Context::setSourceRgba(double& red, double& green, double& blue, double& alpha) const
{
    cairo_set_source_rgba(this->c, red, green, blue, alpha);
    verify();
}

void Context::stroke() const
{
    cairo_stroke(this->c);
    verify();
}

void Context::paint() const
{
    cairo_paint(this->c);
    verify();
}

void Context::setLineCap(const cairo_line_cap_t &cap) const
{
    cairo_set_line_cap(this->c, cap);
    verify();
}

cairo_line_cap_t Context::getLineCap() const
{
    cairo_line_cap_t cap = cairo_get_line_cap(this->c);
    verify();
    return cap;
}

void Context::setLineJoin(const cairo_line_join_t &join) const
{
   cairo_set_line_join(this->c, join);
   verify();
}

cairo_line_join_t Context::getLineJoin() const
{
   cairo_line_join_t join = cairo_get_line_join(this->c);
   verify();
   return join;
}

void Context::setLineWidth(const double &width) const
{
    cairo_set_line_width(this->c, width);
    verify();
}

double Context::getLineWidth() const
{
    double width = cairo_get_line_width(this->c);
    verify();
    return width;
}

void Context::setMiterLimit(const double &limit) const
{
    cairo_set_miter_limit(this->c, limit);
    verify();
}

double Context::getMiterLimit() const
{
    double limit = cairo_get_miter_limit(this->c);
    verify();
    return limit;
}

void Context::setOperator(const cairo_operator_t &op) const
{
    cairo_set_operator(this->c, op);
    verify();
}

cairo_operator_t Context::getOperator() const
{
    cairo_operator_t op = cairo_get_operator(this->c);
    verify();
    return op;
}

void Context::setFillRule(const cairo_fill_rule_t &rule) const
{
    cairo_set_fill_rule(this->c, rule);
    verify();
}

cairo_fill_rule_t Context::getFillRule() const
{
    cairo_fill_rule_t rule = cairo_get_fill_rule(this->c);
    verify();
    return rule;
}

bool Context::hasCurrentPoint() const
{
    cairo_bool_t res = cairo_has_current_point(this->c);
    verify();
    return res != 0;
}

void Context::moveTo(const double &x, const double &y) const
{
    cairo_move_to(this->c, x, y);
    verify();
}

void Context::lineTo(const double &x, const double &y) const
{
    cairo_line_to(this->c, x, y);
    verify();
}

void Context::rectangle(const double &x, const double &y, const double& width, const double& height) const
{
    cairo_rectangle(this->c, x, y, width, height);
    verify();
}

void Context::getCurrentPoint(double *x, double *y) const
{
    cairo_get_current_point(this->c, x, y);
    verify();
}

void Context::newPath() const
{
    cairo_new_path(this->c);
    verify();
}

void Context::newSubpath() const
{
    cairo_new_sub_path(this->c);
    verify();
}

void Context::closePath() const
{
    cairo_close_path(this->c);
    verify();
}

void Context::arc(const double &xc, const double &yc, const double &radius, const double &angle1, const double &angle2) const
{
    cairo_arc(this->c, xc, yc, radius, angle1, angle2);
    verify();
}

void Context::negativeArc(const double &xc, const double &yc, const double &radius, const double &angle1, const double &angle2) const
{
    cairo_arc_negative(this->c, xc, yc, radius, angle1, angle2);
    verify();
}

void Context::curveTo(const double &x1, const double &y1, const double &x2, const double &y2, const double &x3, const double &y3) const
{
    cairo_curve_to(this->c, x1, y1, x2, y2, x3, y3);
    verify();
}

void Context::relCurveTo(const double &x1, const double &y1, const double &x2, const double &y2, const double &x3, const double &y3) const
{
    cairo_rel_curve_to(this->c, x1, y1, x2, y2, x3, y3);
    verify();
}

void Context::relLineTo(const double &x, const double &y) const
{
    cairo_rel_line_to(this->c, x, y);
    verify();
}

void Context::relMoveTo(const double &x, const double &y) const
{
    cairo_rel_move_to(this->c, x, y);
    verify();
}

void Context::textPath(const char *text) const
{
    cairo_text_path(this->c, text);
    verify();
}

void Context::pathExtents(double *x1, double *y1, double *x2, double *y2) const
{
    cairo_path_extents(this->c, x1, y1, x2, y2);
    verify();
}

cairo_antialias_t Context::getAntialias() const
{
    cairo_antialias_t antialias = cairo_get_antialias(this->c);
    verify();
    return antialias;
}


void Context::setAntialias(cairo_antialias_t &antialias) const
{
    cairo_set_antialias(this->c, antialias);
    verify();
}

double Context::getTolerance() const
{
    double tolerance = cairo_get_tolerance(this->c);
    verify();
    return tolerance;
}

void Context::setTolerance(double &tolerance) const
{
    cairo_set_tolerance(this->c, tolerance);
    verify();
}

} // bindings

} // cairodart
