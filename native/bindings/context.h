#ifndef CONTEXT_H
#define CONTEXT_H

#include "cairoobject.h"
#include "surface.h"
#include <cairo/cairo.h>

namespace cairodart
{

namespace bindings
{

class Context : public CairoObject
{
private:
    cairo_t* c;
public:
    Context(Surface* c);
    virtual ~Context();

    void verify() const;

    void save() const;
    void restore() const;
    void pushGroup() const;
    void pushGroupWithContent(const cairo_content_t& c) const;
    void popGroupToSource() const;
    void setSourceRgb(double& red, double& green, double& blue) const;
    void setSourceRgba(double& red, double& green, double& blue, double& alpha) const;
    void stroke() const;
    void paint() const;
    void setLineCap(const cairo_line_cap_t& cap) const;
    cairo_line_cap_t getLineCap() const;
    void setLineJoin(const cairo_line_join_t& join) const;
    cairo_line_join_t getLineJoin() const;
    void setLineWidth(const double& width) const;
    double getLineWidth() const;
    void setMiterLimit(const double& limit) const;
    double getMiterLimit() const;
};

} // bindings

} // cairodart

#endif // CONTEXT_H
