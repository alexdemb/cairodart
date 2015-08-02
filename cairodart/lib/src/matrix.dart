///
/// This library is free software; you can redistribute it and/or
/// modify it under the terms of the GNU Lesser General Public
/// License as published by the Free Software Foundation; either
/// version 2.1 of the License, or (at your option) any later version.
///
/// This library is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
/// Lesser General Public License for more details.
///
/// You should have received a copy of the GNU Lesser General Public
/// License along with this library; if not, write to the Free Software
/// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
/// MA 02110-1301  USA
///

part of cairodart.base;

///
/// Generic matrix operations.
///
abstract class Matrix {


  /// xx component of the affine transformation
  double get xx;

  /// yx component of the affine transformation
  double get yx;

  /// xy component of the affine transformation
  double get xy;

  /// yy component of the affine transformation
  double get yy;

  /// X translation component of the affine transformation
  double get x0;

  /// Y translation component of the affine transformation
  double get y0;


  ///
  /// Create a matrix with all components equal to 0.
  ///
  factory Matrix.zero() => new _Matrix(0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

  ///
  /// Create a matrix using specified components.
  ///
  /// This is a constructor that creates a matrix and call [init()] method for a created matrix.
  ///
  factory Matrix(num xx, num yx, num xy, num yy, num x0, num y0) =>
      new _Matrix(xx.toDouble(), yx.toDouble(), xy.toDouble(), yy.toDouble(), x0.toDouble(), y0.toDouble());

  ///
  /// Sets matrix to be the affine transformation given by xx, yx, xy, yy, x0, y0.
  ///
  void init(num xx, num yx, num xy, num yy, num x0, num y0);

  ///
  /// Modifies matrix to be an identity transformation.
  ///
  void initIdentity();

  ///
  /// Initializes matrix to a transformation that translates by tx and ty in the X and Y dimensions, respectively.
  ///
  void initTranslate(double tx, double ty);

  ///
  /// Initializes matrix to a transformation that scales by sx and sy in the X and Y dimensions, respectively.
  ///
  void initScale(double sx, double sy);

  ///
  /// Initialized matrix to a transformation that rotates by radians.
  ///
  void initRotate(double radians);

  ///
  /// Applies a translation by tx, ty to the transformation in matrix.
  ///
  /// The effect of the new transformation is to first translate the coordinates by tx and ty,
  /// then apply the original transformation to the coordinates.
  ///
  void translate(double tx, double ty);

  ///
  /// Applies scaling by sx, sy to the transformation in matrix .
  ///
  /// The effect of the new transformation is to first scale the coordinates by sx and sy,
  /// then apply the original transformation to the coordinates.
  ///
  void scale(double sx, double sy);

  ///
  /// Applies rotation by radians to the transformation in matrix.
  ///
  /// The effect of the new transformation is to first rotate the coordinates by radians,
  /// then apply the original transformation to the coordinates.
  ///
  void rotate(double radians);

  ///
  /// Changes matrix to be the inverse of its original value.
  ///
  /// Not all transformation matrices have inverses; if the matrix collapses points together
  /// (it is degenerate), then it has no inverse and this method will fail.
  ///
  void invert();

  ///
  /// Multiplies the affine transformations in m1 and m2 together returning the result.
  ///
  /// The effect of the resulting transformation is to first apply the transformation in m1 to the coordinates and
  /// then apply the transformation in m2 to the coordinates.
  ///
  static Matrix multiply(Matrix m1, Matrix m2) native 'matrix_multiply';


  ///
  /// Transforms the point (x , y) by matrix.
  ///
  Point get transformPoint;

  ///
  /// Transforms the distance vector (dx ,dy) by matrix .
  ///
  /// This is similar to [transformPoint] except that the translation components of the transformation are ignored.
  ///
  Distance get transformDistance;
  
}

class _Matrix extends NativeFieldWrapperClass2 implements Matrix {
  
  double get xx native 'matrix_xx';
  double get yx native 'matrix_yx';
  double get xy native 'matrix_xy';
  double get yy native 'matrix_yy';
  double get x0 native 'matrix_x0';
  double get y0 native 'matrix_y0';
  
  _Matrix.internal() {
  }
  
  _Matrix(double xx, double yx, double xy, double yy, double x0, double y0) {
    _create();
    init(xx, yx, xy, yy, x0, y0);
  }
  
  void _create() native 'matrix_create';
  
  void init(num xx, num yx, num xy, num yy, num x0, num y0) => _init(xx.toDouble(), yx.toDouble(), xy.toDouble(), yy.toDouble(), x0.toDouble(), y0.toDouble());

  void _init(double xx, double yx, double xy, double yy, double x0, double y0) native 'matrix_init';
  
  void initIdentity() native 'matrix_init_identity';
  void initTranslate(double tx, double ty) native 'matrix_init_translate';
  void initScale(double sx, double sy) native 'matrix_init_scale';
  void initRotate(double radians) native 'matrix_init_rotate';
    
  void translate(double tx, double ty) native 'matrix_translate';
  void scale(double sx, double sy) native 'matrix_scale';
  void rotate(double radians) native 'matrix_rotate';
    
  void invert() native 'matrix_invert';
  Point get transformPoint native 'matrix_transform_point';
  Distance get transformDistance native 'matrix_transform_distance';
  
  @override
  operator==(Matrix other) =>
            xx == other.xx &&
            yx == other.yx &&
            xy == other.xy &&
            yy == other.yy &&
            x0 == other.x0 &&
            y0 == other.y0;
  
}