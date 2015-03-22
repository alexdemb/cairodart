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


} // bindings

} // cairodart
