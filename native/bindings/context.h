#ifndef CONTEXT_H
#define CONTEXT_H

#include "cairoobject.h"
#include "surface.h"
#include <cairo/cairo.h>

namespace cairodart
{

namespace bindings
{

class Context : public CairoObject
{
private:
    cairo_t* c;
public:
    Context(Surface* c);
    virtual ~Context();

    void verify() const;

    void save() const;
    void restore() const;
    void pushGroup() const;
    void pushGroupWithContent(const cairo_content_t& c) const;
    void popGroupToSource() const;
    void setSourceRgb(double& red, double& green, double& blue) const;
    void setSourceRgba(double& red, double& green, double& blue, double& alpha) const;
    void stroke() const;
    void paint() const;
    void setLineCap(const cairo_line_cap_t& cap) const;
    cairo_line_cap_t getLineCap() const;
    void setLineJoin(const cairo_line_join_t& join) const;
    cairo_line_join_t getLineJoin() const;
    void setLineWidth(const double& width) const;
    double getLineWidth() const;
    void setMiterLimit(const double& limit) const;
    double getMiterLimit() const;
    cairo_operator_t getOperator() const;
    void setOperator(const cairo_operator_t& op) const;
    cairo_fill_rule_t getFillRule() const;
    void setFillRule(const cairo_fill_rule_t& rule) const;
    bool hasCurrentPoint() const;
    void moveTo(const double& x, const double& y) const;
    void relMoveTo(const double& x, const double& y) const;
    void lineTo(const double& x, const double& y) const;
    void relLineTo(const double& x, const double& y) const;
    void rectangle(const double& x, const double& y, const double& width, const double& height) const;
    void getCurrentPoint(double* x, double* y) const;
    void newPath() const;
    void newSubpath() const;
    void closePath() const;
    void arc(const double& xc, const double& yc, const double& radius, const double& angle1, const double& angle2) const;
    void negativeArc(const double& xc, const double& yc, const double& radius, const double& angle1, const double& angle2) const;
    void curveTo(const double& x1, const double& y1, const double& x2, const double& y2, const double& x3, const double& y3) const;
    void relCurveTo(const double& x1, const double& y1, const double& x2, const double& y2, const double& x3, const double& y3) const;
    void textPath(const char* text) const;
    void pathExtents(double* x1, double* y1, double* x2, double* y2) const;
    cairo_antialias_t getAntialias() const;
    void setAntialias(cairo_antialias_t& antialias) const;
    double getTolerance() const;
    void setTolerance(double& tolerance) const;
    void clip() const;
    void clipPreserve() const;
    bool inClip(const double& x, const double& y) const;
};

} // bindings

} // cairodart

#endif // CONTEXT_H
