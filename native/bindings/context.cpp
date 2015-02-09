#include "context.h"
#include "infrastructure/infrastructure.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

Context::Context(Surface* surface)
{
    cairo_t* handle = cairo_create(surface->getHandle());
    this->c = handle;
}

Context::~Context()
{
    if (this->c)
    {
        cairo_destroy(this->c);
        c = nullptr;
    }
}

void Context::verify() const
{
    cairo_status_t status = cairo_status(this->c);
    Utils::verify(status);
}

} // bindings

} // cairodart
