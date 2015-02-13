#ifndef FORMAT_H
#define FORMAT_H

#include <cairo/cairo.h>
#include "dart_api.h"

namespace cairodart
{

namespace bindings
{

class Format final
{
public:
    static int strideForWidth(const cairo_format_t& format, const int& width);
};

} // bindings

} // cairodart

#endif // FORMAT_H
