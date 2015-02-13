#include "format.h"

namespace cairodart
{

namespace bindings
{

int Format::strideForWidth(const cairo_format_t& format, const int& width)
{
    return cairo_format_stride_for_width(format, width);
}

} // bindings

} // cairodart
