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

} // bindings

} // cairodart
