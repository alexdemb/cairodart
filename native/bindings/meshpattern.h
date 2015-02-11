#ifndef MESHPATTERN_H
#define MESHPATTERN_H

#include "pattern.h"

namespace cairodart
{

namespace bindings
{

class MeshPattern : public Pattern
{
public:
    MeshPattern(cairo_pattern_t* p);

    virtual ~MeshPattern();

    void beginPatch() const;
    void endPatch() const;
    void moveTo(const double& x, const double& y) const;
    void lineTo(const double& x, const double& y) const;
    void curveTo(const double& x1, const double& y1, const double& x2, const double& y2, const double& x3, const double& y3) const;
    void setControlPoint(const unsigned int& pointNum, const double& x, const double& y) const;
    void getControlPoint(const unsigned int& patchNum, const unsigned int& pointNum, double* x, double* y) const;
    void setCornerColor(const unsigned int& pointNum, const double& red, const double& green, const double& blue) const;
    void setCornerColor(const unsigned int& pointNum, const double& red, const double& green, const double& blue, const double& alpha) const;
    unsigned int getPatchCount() const;
    void getCornerColor(const unsigned int& patchNum, const unsigned int& cornerNum, double* red, double* green, double* blue, double* alpha) const;

};

} // bindings

} // cairodart

#endif // MESHPATTERN_H
