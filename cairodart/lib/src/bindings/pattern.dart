part of cairodart.base;

abstract class Pattern {
 
  factory Pattern.fromRgb(double red, double green, double blue) => 
      new _Pattern.fromRgb(red, green, blue);
  
  factory Pattern.fromRgba(double red, double green, double blue, double alpha) =>
      new _Pattern.fromRgba(red, green, blue, alpha);
  
  factory Pattern.forSurface(Surface surface) => 
      new _Pattern.forSurface(surface);
  
  factory Pattern.linear(double x0, double y0, double x1, double y1) =>
      new _Pattern.linear(x0, y0, x1, y1);
  
  factory Pattern.radial(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1) =>
      new _Pattern.radial(cx0, cy0, radius0, cx1, cy1, radius1);
 
  factory Pattern.mesh() => new _MeshPattern();
}

abstract class MeshPattern {
  
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
  
  _Pattern.fromRgb(double red, double green, double blue) {
    _createFromRgb(red, green, blue);
  }
  
  _Pattern.fromRgba(double red, double green, double blue, double alpha) {
    _createFromRgba(red, green, blue, alpha);
  }
  
  _Pattern.forSurface(Surface surface) {
    _createForSurface(surface);
  }
  
  _Pattern.linear(double x0, double y0, double x1, double y1) {
    _createLinear(x0, y0, x1, y1);
  }
  
  _Pattern.radial(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1) {
    _createRadial(cx0, cy0, radius0, cx1, cy1, radius1);
  }
  
  _Pattern();
  
  _createFromRgb(double red, double green, double blue) native 'pattern_create_rgb';
  _createFromRgba(double red, double green, double blue, double alpha) native 'pattern_create_rgba';
  _createForSurface(Surface surface) native 'pattern_create_for_surface';
  _createLinear(double x0, double y0, double x1, double y1) native 'pattern_create_linear';
  _createRadial(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1) native 'pattern_create_radial';
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
