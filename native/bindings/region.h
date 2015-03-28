#ifndef REGION_H
#define REGION_H

#include <cairo/cairo.h>
#include "cairoobject.h"

namespace cairodart
{


namespace bindings
{


class Region : public CairoObject
{
public:
    Region(cairo_region_t* r);
    ~Region();

    void verify() const;

    Region* copy() const;
    cairo_rectangle_int_t getExtents() const;
    int getNumRectangles() const;
    cairo_rectangle_int_t getRectangle(const int& nth) const;
    bool isEmpty() const;
    bool containsPoint(const int& x, const int& y) const;
private:
    cairo_region_t* r;
};

} // bindings

} // cairodart

#endif // REGION_H
