part of cairodart.base;

abstract class Pattern {
 

  factory Pattern.forSurface(Surface surface) => 
      new _Pattern.forSurface(surface);
  

  factory Pattern.radial(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1) =>
      new _Pattern.radial(cx0, cy0, radius0, cx1, cy1, radius1);
 
  factory Pattern.mesh() => new _MeshPattern();
  


  List<Circle> get radialCircles;
  Extend get extend;
  void set extend(Extend extend);
  Filter get filter;
  void set filter(Filter filter);
  PatternType get patternType;
  Matrix get matrix;
  void set matrix(Matrix matrix);
  
  operator==(Pattern pattern);
}


abstract class SolidPattern {
  factory SolidPattern.fromRgb(double red, double green, double blue) =>
    new _SolidPattern.fromRgb(red, green, blue);

  factory SolidPattern.fromRgba(double red, double green, double blue, double alpha) =>
    new _SolidPattern.fromRgba(red, green, blue, alpha);

  factory SolidPattern.fromColor(Color color, [bool solid = false]) =>
    new _SolidPattern.fromColor(color, solid);

  Color get color;

}

class _SolidPattern extends _Pattern implements SolidPattern {

  _SolidPattern.fromRgb(double red, double green, double blue) {
    _createFromRgb(red, green, blue);
  }

  _SolidPattern.fromRgba(double red, double green, double blue, double alpha) {
    _createFromRgba(red, green, blue, alpha);
  }

  _SolidPattern.fromColor(Color color, bool solid) {
    if (solid)
      _createFromRgb(color.red, color.green, color.blue);
    else
      _createFromRgba(color.red, color.green, color.blue, color.alpha);
  }

  _createFromRgb(double red, double green, double blue) native 'pattern_create_rgb';
  _createFromRgba(double red, double green, double blue, double alpha) native 'pattern_create_rgba';


  Color get color native 'pattern_get_rgba';
}


abstract class Gradient implements Pattern {
  void addColorStop(ColorStop stop);
  ColorStop colorStopAt(int index);
  int get colorStopCount;
}

class _Gradient extends _Pattern implements Gradient {
  void addColorStop(ColorStop stop) {
    _addColorStop(stop.offset, stop.color.red, stop.color.green, stop.color.blue, stop.color.alpha);
  }

  _addColorStop(double offset, double red, double green, double blue, double alpha) native 'pattern_add_color_stop_rgba';

  ColorStop colorStopAt(int index) native 'pattern_get_color_stop_rgba';
  int get colorStopCount native 'pattern_get_color_stop_count';
}

abstract class LinearGradient implements Gradient {
  factory LinearGradient(num x0, num y0, num x1, num y1) => new _LinearGradient(x0.toDouble(), y0.toDouble(), x1.toDouble(), y1.toDouble());

  List<Point> get linearPoints;
}

class _LinearGradient extends _Gradient implements LinearGradient {
  List<Point> get linearPoints native 'pattern_get_linear_points';

  _LinearGradient(double x0, double y0, double x1, double y1) {
    _createLinear(x0, y0, x1, y1);
  }

  _createLinear(double x0, double y0, double x1, double y1) native 'pattern_create_linear';
}


abstract class MeshPattern implements Pattern {
  
  factory MeshPattern() => new _MeshPattern();
  
  void beginPatch();
  void endPatch();
  void moveTo(double x, double y);
  void lineTo(double x, double y);
  void curveTo(double x1, double y1, double x2, double y2, double x3, double y3);
  
  Point getControlPoint(int patchNum, int pointNum); 
  void setControlPoint(int pointNum, Point p);      
  
  Color getCornerColor(int patchNum, int pointNum);
  void setCornerColor(int pointNum, Color color);
  
  int get patchCount;  
}


class _Pattern extends NativeFieldWrapperClass2 implements Pattern {
  

  
  _Pattern.forSurface(Surface surface) {
    _createForSurface(surface);
  }
  

  
  _Pattern.radial(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1) {
    _createRadial(cx0, cy0, radius0, cx1, cy1, radius1);
  }
  
  _Pattern();
  
  _createForSurface(Surface surface) native 'pattern_create_for_surface';

  _createRadial(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1) native 'pattern_create_radial';
  
  


  List<Circle> get radialCircles native 'pattern_get_radial_circles';
  Extend get extend => new _Extend(_getExtendValue());
      
  int _getExtendValue() native 'pattern_get_extend';
  
  void set extend(Extend extend) {
    _setExtendValue(extend.value);
  }
  
  _setExtendValue(int value) native 'pattern_set_extend';
  
  Filter get filter => new _Filter(_getFilterValue());
  
  int _getFilterValue() native 'pattern_get_filter';
  
  void set filter(Filter filter) {
    _setFilter(filter.value);
  }
  
  void _setFilter(int value) native 'pattern_set_filter';
  
  PatternType get patternType => new _PatternType(_getPatternType());
  
  int _getPatternType() native 'pattern_get_type';
  
  Matrix get matrix native 'pattern_get_matrix';
  void set matrix(Matrix matrix) native 'pattern_set_matrix';
    
  @override
  operator==(Pattern pattern) native 'pattern_equals';
}

class _MeshPattern extends _Pattern implements MeshPattern {
  
  _MeshPattern() {
    _createMesh();
  }
  
  _createMesh() native 'pattern_create_mesh';
  
  void beginPatch() native 'pattern_mesh_begin_patch';
  void endPatch() native 'pattern_mesh_end_patch';
  void moveTo(double x, double y) native 'pattern_mesh_move_to';
  void lineTo(double x, double y) native 'pattern_mesh_line_to';
  void curveTo(double x1, double y1, double x2, double y2, double x3, double y3) native 'pattern_mesh_curve_to';
    
  Point getControlPoint(int patchNum, int pointNum) native 'pattern_mesh_get_control_point';
  void setControlPoint(int pointNum, Point p) {
    _setControlPoint(pointNum, p.x, p.y);
  }
    
  void _setControlPoint(int pointNum, double x, double y) native 'pattern_mesh_set_control_point';
  
  Color getCornerColor(int patchNum, int pointNum) native 'pattern_mesh_get_corner_color';
  void setCornerColor(int pointNum, Color color) {
    _setCornerColor(pointNum, color.red, color.green, color.blue, color.alpha);
  }
  
  void _setCornerColor(int pointNum, double red, double green, double blue, double alpha) native 'pattern_mesh_set_corner_color';
    
  int get patchCount native 'pattern_mesh_get_patch_count';
}


