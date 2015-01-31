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
private:
    cairo_format_t f;
public:
    Format(cairo_format_t format);
    virtual ~Format();

    cairo_format_t format() const;
    int strideForWidth(int width) const;
};

} // bindings

} // cairodart

#endif // FORMAT_H
