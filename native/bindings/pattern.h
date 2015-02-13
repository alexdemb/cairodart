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

    void addColorStop(const double& offset, const double& red, const double& green, const double& blue) const;
    void addColorStop(const double& offset, const double& red, const double& green, const double& blue, const double& alpha) const;
    int colorStopCount() const;
    void getColorStop(const int& index, double* offset, double* red, double* green, double* blue, double* alpha) const;
    void getLinearPoints(double* x0, double* y0, double* x1, double* y1) const;
    void getRadialCircles(double* cx0, double* cy0, double* r0, double* cx1, double* cy1, double* r1) const;
    cairo_extend_t getExtend() const;
    void setExtend(const cairo_extend_t& extend) const;
    cairo_filter_t getFilter() const;
    void setFilter(const cairo_filter_t& filter) const;


};

} // bindings

} // cairodart

#endif // PATTERN_H
