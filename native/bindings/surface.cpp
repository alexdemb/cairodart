#include "infrastructure/utils.h"
#include "surface.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

Surface::Surface()
{
    std::cout << "Object created" << std::endl;
}

Surface::~Surface()
{
    if (this->surface)
    {
        cairo_surface_destroy(this->surface);
        verify();
        this->surface = nullptr;
        std::cout << "Object destroyed" << std::endl;
    }
}

cairo_format_t Surface::cairoFormatFromHandle(const Dart_Handle& formatHandle)
{
    int64_t val = Utils::toInteger(Utils::getField(formatHandle, "value"));
    cairo_format_t result = static_cast<cairo_format_t>(val);
    return result;
}

void Surface::verify() const
{
    cairo_status_t status = cairo_surface_status(surface);
    Utils::verify(status);
}

} // bindings

} // cairodart
