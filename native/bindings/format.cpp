#include "format.h"

namespace cairodart
{

namespace bindings
{

Format::Format(cairo_format_t format) : f(format)
{
}

Format::~Format()
{
}

cairo_format_t Format::format() const
{
    return f;
}

int Format::strideForWidth(int width) const
{
    return cairo_format_stride_for_width(format(), width);
}

} // bindings

} // cairodart
