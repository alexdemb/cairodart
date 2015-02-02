part of cairodart.base;

abstract class Point {
  
  factory Point() => new _Point(0.0, 0.0);
  factory Point.from(double x, double y) => new _Point(x, y);
    
  double get x;
  double get y;
}

class _Point implements Point {
  
  double _x;
  double _y;
  
  _Point(this._x, this._y);
  
  double get x => _x;
  double get y => _y;
}


