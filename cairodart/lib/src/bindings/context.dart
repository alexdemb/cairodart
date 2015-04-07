part of cairodart.base;

abstract class Context {
  
  factory Context(Surface surface) {
    return new _Context(surface);
  }
  
  void save();
  void restore();
  void pushGroup();
  void pushGroupWithContent(Content content);
  void popGroupToSource();
  void setSourceRgb(double red, double green, double blue);
  void setSourceRgba(double red, double green, double blue, double alpha);
  void stroke();
  void paint();
  void moveTo(double x, double y);
  void relativeMoveTo(double x, double y);
  void moveToPoint(Point p);
  void relativeMoveToPoint(Point p);
  void lineTo(double x, double y);
  void relativeLineTo(double x, double y);
  void lineToPoint(Point p);
  void relativeLineToPoint(Point p);
  void rectangleByCoords(double x, double y, double width, double height);
  void rectangle(Rectangle rect);
  void newPath();
  void newSubpath();
  void closePath();
  void arc(double xc, double yc, double radius, double angle1, double angle2);
  void negativeArc(double xc, double yc, double radius, double angle1, double angle2);
  void curveTo(double x1, double y1, double x2, double y2, double x3, double y3);
  void relativeCurveTo(double x1, double y1, double x2, double y2, double x3, double y3);
  
  LineCap lineCap;
  LineJoin lineJoin;
  double lineWidth;
  double miterLimit;
  
  Operator operator;
  FillRule fillRule;
  
  Surface get target;
  
  bool get hasCurrentPoint;
  Point get currentPoint;
}


class _Context extends NativeFieldWrapperClass2 implements Context {
  
  Surface _surface;
  
  _Context(this._surface) {
    _create(_surface);
  }
  
  void _create(Surface surface) native 'context_create';
  
  void save() native 'save';
  
  void restore() native 'restore';
  
  void pushGroup() native 'push_group';
  
  void pushGroupWithContent(Content content) {
    _pushGroupWithContent(content.value);
  }
  
  void _pushGroupWithContent(int value) native 'push_group_with_content';
  
  void popGroupToSource() native 'pop_group_to_source';
  
  void setSourceRgb(double red, double green, double blue) native 'set_source_rgb';
  
  void setSourceRgba(double red, double green, double blue, double alpha) native 'set_source_rgba';
  
  void stroke() native 'stroke';
  
  void paint() native 'paint';
  
  Surface get target => _surface;
  
  LineCap get lineCap native 'get_line_cap';
  
  void set lineCap(LineCap cap) => _setLineCap(cap.value);
  
  void _setLineCap(int value) native 'set_line_cap';
  
  LineJoin get lineJoin native 'get_line_join';
  
  void set lineJoin(LineJoin join) => _setLineJoin(join.value);
  
  void _setLineJoin(int value) native 'set_line_join';
  
  double get lineWidth native 'get_line_width';
  
  void set lineWidth(double width) native 'set_line_width';
  
  double get miterLimit native 'get_miter_limit';
  
  void set miterLimit(double limit) native 'set_miter_limit';
  
  Operator get operator native 'get_operator';
  
  void set operator(Operator op) => _setOperator(op.value);
  
  void _setOperator(int val) native 'set_operator';
  
  FillRule get fillRule native 'get_fill_rule';
  
  void set fillRule(FillRule rule) => _setFillRule(rule.value);
  
  void _setFillRule(int val) native 'set_fill_rule';
  
  bool get hasCurrentPoint native 'has_current_point';
  
  void moveTo(double x, double y) native 'move_to';
  
  void moveToPoint(Point p) => moveTo(p.x, p.y);
  
  void lineTo(double x, double y) native 'line_to';
  
  void lineToPoint(Point p) => lineTo(p.x, p.y);
  
  void rectangleByCoords(double x, double y, double width, double height) native 'rectangle';
  
  void rectangle(Rectangle rect) => rectangleByCoords(rect.x.toDouble(), rect.y.toDouble(), rect.width.toDouble(), rect.height.toDouble());
  
  Point get currentPoint native 'get_current_point';
  
  void newPath() native 'new_path';
  
  void newSubpath() native 'new_sub_path';
  
  void closePath() native 'close_path';
  
  void arc(double xc, double yc, double radius, double angle1, double angle2) native 'arc';
  
  void negativeArc(double xc, double yc, double radius, double angle1, double angle2) native 'arc_negative';
    
  void curveTo(double x1, double y1, double x2, double y2, double x3, double y3) native 'curve_to';
  
  void relativeCurveTo(double x1, double y1, double x2, double y2, double x3, double y3) native 'rel_curve_to';
  
  void relativeMoveTo(double x, double y) native 'rel_move_to';
  
  void relativeMoveToPoint(Point p) => relativeMoveTo(p.x, p.y);
  
  void relativeLineTo(double x, double y) native 'rel_line_to';
  
  void relativeLineToPoint(Point p) => relativeLineTo(p.x, p.y);
}
