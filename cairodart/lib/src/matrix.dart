part of cairodart.base;

abstract class Matrix {
  
  double get xx;
  double get yx;
  double get xy;
  double get yy;
  double get x0;
  double get y0;
  
  factory Matrix.zero() => new _Matrix(0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
  
  factory Matrix(num xx, num yx, num xy, num yy, num x0, num y0) =>
      new _Matrix(xx.toDouble(), yx.toDouble(), xy.toDouble(), yy.toDouble(), x0.toDouble(), y0.toDouble());
  
  void init(num xx, num yx, num xy, num yy, num x0, num y0);
  
  void initIdentity();
  void initTranslate(double tx, double ty);
  void initScale(double sx, double sy);
  void initRotate(double radians);
  
  void translate(double tx, double ty);
  void scale(double sx, double sy);
  void rotate(double radians);
  
  void invert();
  static Matrix multiply(Matrix m1, Matrix m2) native 'matrix_multiply';
  Point get transformPoint;
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