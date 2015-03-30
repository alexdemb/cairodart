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

} // bindings

} // cairodart
