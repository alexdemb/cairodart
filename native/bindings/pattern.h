#ifndef PATTERN_H
#define PATTERN_H

#include <cairo/cairo.h>
#include "cairoobject.h"
#include "surface.h"


namespace cairodart
{


namespace bindings
{

class MeshPattern;

class Pattern : public CairoObject
{
protected:
    cairo_pattern_t* pattern;
    Pattern(cairo_pattern_t* pattern);
public:
    static Pattern* createPatternForRgb(const double& red, const double& green, const double& blue);
    static Pattern* createPatternForRgba(const double& red, const double& green, const double& blue, const double& alpha);
    static Pattern* createForSurface(const Surface* surface);
    static Pattern* createLinear(const double& x0, const double& y0, const double& x1, const double& y1);
    static Pattern* createRadial(const double& cx0, const double& cy0, const double& radius0, const double& cx1, const double& cy1, const double& radius1);
    static MeshPattern* createMesh();

    virtual void verify() const;
    virtual ~Pattern();
};

} // bindings

} // cairodart

#endif // PATTERN_H
