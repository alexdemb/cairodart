#ifndef CONTEXT_H
#define CONTEXT_H

#include "cairoobject.h"
#include "surface.h"
#include "content.h"
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
    void pushGroupWithContent(const Content* c) const;
    void popGroupToSource() const;
    void setSourceRgb(double& red, double& green, double& blue) const;
    void setSourceRgba(double& red, double& green, double& blue, double& alpha) const;
    void stroke() const;
    void paint() const;
};

} // bindings

} // cairodart

#endif // CONTEXT_H
