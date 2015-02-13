#ifndef MATRIX_H
#define MATRIX_H

#include <cairo/cairo.h>

class Matrix final
{
private:
    cairo_matrix_t* matrix;
public:
    Matrix(cairo_matrix_t* matrix);
    Matrix(const cairo_matrix_t matrix);
    virtual ~Matrix();

    void init(const double& xx, const double& yx, const double& xy, const double& yy, const double& x0, const double& y0) const;
    void initIdentify() const;
    void initTranslate(const double& tx, const double& ty) const;
    void initScale(const double& sx, const double& sy) const;
    void initRotate(const double& radians);
    void translate(const double& tx, const double& ty) const;
    void scale(const double& sx, const double& sy) const;
    void rotate(const double& radians) const;
    void invert() const;
    static Matrix* multiply(const Matrix* m1, const Matrix* m2);
    void getTransformDistance(double* dx, double* dy) const;
    void getTransformPoint(double* x, double* y) const;

    double xx() const;
    double yx() const;
    double xy() const;
    double yy() const;
    double x0() const;
    double y0() const;
};

#endif // MATRIX_H
