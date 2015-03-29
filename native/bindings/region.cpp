#include "region.h"
#include <infrastructure/infrastructure.h>

using namespace cairodart::infrastructure;

namespace cairodart
{


namespace bindings
{


Region::Region(cairo_region_t* r)
{
    this->r = r;
}

Region::~Region()
{
    if (this->r)
    {
        cairo_region_destroy(r);
        r = nullptr;
    }
}

void Region::verify() const
{
    cairo_status_t status = cairo_region_status(this->r);
    Utils::verify(status);
}

Region* Region::copy() const
{
    cairo_region_t* copy = cairo_region_copy(this->r);
    verify();
    return new Region(copy);
}

cairo_rectangle_int_t Region::getExtents() const
{
    cairo_rectangle_int_t extents;
    cairo_region_get_extents(this->r, &extents);
    verify();
    return extents;
}

int Region::getNumRectangles() const
{
    int num = cairo_region_num_rectangles(this->r);
    verify();
    return num;
}

cairo_rectangle_int_t Region::getRectangle(const int &nth) const
{
    cairo_rectangle_int_t rect;
    cairo_region_get_rectangle(this->r, nth, &rect);
    verify();
    return rect;
}

bool Region::isEmpty() const
{
    cairo_bool_t res = cairo_region_is_empty(this->r);
    verify();
    return res != 0;
}

bool Region::containsPoint(const int &x, const int &y) const
{
    cairo_bool_t res = cairo_region_contains_point(this->r, x, y);
    verify();
    return res != 0;
}

cairo_region_overlap_t Region::containsRectangle(const int &x, const int &y, const int &width, const int &height) const
{
    cairo_rectangle_int_t rect;
    rect.x = x;
    rect.y = y;
    rect.width = width;
    rect.height = height;
    cairo_region_overlap_t overlap = cairo_region_contains_rectangle(this->r, &rect);
    verify();
    return overlap;
}

bool Region::operator==(const Region& other) const
{
    cairo_bool_t equal = cairo_region_equal(this->r, other.r);
    verify();
    return equal != 0;
}

void Region::translate(const int &dx, const int &dy) const
{
    cairo_region_translate(this->r, dx, dy);
    verify();
}

void Region::intersect(Region *other) const
{
    cairo_region_intersect(this->r, other->r);
    verify();
}

void Region::intersectRectangle(const int &x, const int &y, const int &width, const int &height) const
{
    cairo_rectangle_int_t rect;
    rect.x = x;
    rect.y = y;
    rect.width = width;
    rect.height = height;
    cairo_region_intersect_rectangle(this->r, &rect);
    verify();
}

} // bindings

} // cairodart

