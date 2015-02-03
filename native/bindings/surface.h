#ifndef SURFACE_H
#define SURFACE_H

#include <cairo/cairo.h>
#include "dart_api.h"
#include "cairoobject.h"

namespace cairodart
{

namespace bindings
{

class Surface : public CairoObject
{
protected:
    cairo_surface_t* surface;
    Surface();
public:
    virtual ~Surface();

    void verify() const;

    void flush() const;
    void finish() const;
    int content() const;
    void markDirty() const;
    void markDirtyRect(const int& x, const int& y, const int& width, const int& height) const;
    void setDeviceOffset(const double& x, const double& y) const;
    void getDeviceOffset(double& x, double& y) const;
    void copyPage() const;
    void showPage() const;
    bool hasShowTextGlyphs() const;
    bool supportsMimeType(const char* mimeType) const;
};

} // bindings

} // cairodart

#endif // SURFACE_H
