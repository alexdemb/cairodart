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
    Surface(cairo_surface_t* surface);
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
    int surfaceType() const;
    void setFallbackResolution(const double& xRes, const double& yRes) const;
    void getFallbackResolution(double& xRes, double& yRes) const;
    cairo_surface_t* getHandle() const;

    bool operator==(const Surface& other);
};

} // bindings

} // cairodart

#endif // SURFACE_H
