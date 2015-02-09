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
};

} // bindings

} // cairodart

#endif // CONTEXT_H
