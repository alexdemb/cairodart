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

} // bindings

} // cairodart

