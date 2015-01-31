#include "content.h"

namespace cairodart
{

namespace bindings
{

Content::Content(cairo_content_t content) : c(content)
{
}

Content::~Content()
{
}

cairo_content_t Content::content() const
{
    return c;
}

} // bindings

} // cairodart
