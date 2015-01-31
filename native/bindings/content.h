#ifndef CONTENT_H
#define CONTENT_H

#include <cairo/cairo.h>

namespace cairodart
{

namespace bindings
{

class Content
{
private:
    cairo_content_t c;
public:
    Content(cairo_content_t content);
    virtual ~Content();

    cairo_content_t content() const;
};

} // bindings

} // cairodart


#endif // CONTENT_H
