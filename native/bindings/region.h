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
    static Region* create(cairo_region_t* r);

    Region(cairo_region_t* r);
    ~Region();

    void verify() const;

    Region* copy() const;
    cairo_rectangle_int_t getExtents() const;
    int getNumRectangles() const;
    cairo_rectangle_int_t getRectangle(const int& nth) const;
    bool isEmpty() const;
    bool containsPoint(const int& x, const int& y) const;
    cairo_region_overlap_t containsRectangle(const int& x, const int& y, const int& width, const int& height) const;
    void translate(const int& dx, const int& dy) const;
    void intersect(Region* other) const;
    void intersectRectangle(const int& x, const int& y, const int& width, const int& height) const;
    void subtract(Region* other) const;
    void subtractRectangle(const int& x, const int& y, const int& width, const int& height) const;
    void doUnion(Region* other) const;
    void unionRectangle(const int& x, const int& y, const int& width, const int& height) const;
    void doXor(Region* other) const;
    void xorRectangle(const int& x, const int& y, const int& width, const int& height) const;

    bool operator==(const Region& other) const;
private:
    cairo_region_t* r;
};

} // bindings

} // cairodart

#endif // REGION_H
