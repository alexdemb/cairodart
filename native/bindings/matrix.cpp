#include "matrix.h"

Matrix::Matrix(cairo_matrix_t* matrix)
{
    this->matrix = matrix;
}

Matrix::Matrix(cairo_matrix_t matrix)
{
    this->matrix = new cairo_matrix_t;
    this->matrix->x0 = matrix.x0;
    this->matrix->y0 = matrix.y0;
    this->matrix->xx = matrix.xx;
    this->matrix->yx = matrix.yx;
    this->matrix->xy = matrix.xy;
    this->matrix->yy = matrix.yy;
}

Matrix::~Matrix()
{
    if (matrix)
    {
        delete matrix;
    }
}


void Matrix::init(const double& xx, const double& yx, const double& xy, const double& yy, const double& x0, const double& y0) const
{
    cairo_matrix_init(this->matrix, xx, yx, xy, yy, x0, y0);
}

void Matrix::initIdentify() const
{
    cairo_matrix_init_identity(this->matrix);
}

void Matrix::initTranslate(const double& tx, const double& ty) const
{
    cairo_matrix_init_translate(this->matrix, tx, ty);
}

void Matrix::initScale(const double& sx, const double& sy) const
{
    cairo_matrix_init_scale(this->matrix, sx, sy);
}

void Matrix::initRotate(const double& radians)
{
    cairo_matrix_init_rotate(this->matrix, radians);
}

void Matrix::translate(const double& tx, const double& ty) const
{
    cairo_matrix_translate(this->matrix, tx, ty);
}

void Matrix::scale(const double& sx, const double& sy) const
{
    cairo_matrix_scale(this->matrix, sx, sy);
}

void Matrix::rotate(const double& radians) const
{
    cairo_matrix_rotate(this->matrix, radians);
}

void Matrix::invert() const
{
    cairo_matrix_invert(this->matrix);
}

Matrix* Matrix::multiply(const Matrix* m1, const Matrix* m2)
{
    cairo_matrix_t result;
    cairo_matrix_multiply(&result, m1->matrix, m2->matrix);
    return new Matrix(result);
}

void Matrix::getTransformDistance(double* dx, double* dy) const
{
    cairo_matrix_transform_distance(this->matrix, dx, dy);
}

void Matrix::getTransformPoint(double* x, double* y) const
{
    cairo_matrix_transform_point(this->matrix, x, y);
}

double Matrix::xx() const
{
    return matrix->xx;
}

double Matrix::yx() const
{
    return matrix->yx;
}

double Matrix::xy() const
{
    return matrix->xy;
}

double Matrix::yy() const
{
    return matrix->yy;
}

double Matrix::x0() const
{
    return matrix->x0;
}

double Matrix::y0() const
{
    return matrix->y0;
}
