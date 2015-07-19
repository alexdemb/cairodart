part of cairodart.base;

abstract class Circle {
  
  double get x;
  double get y;
  double get radius;
  
  factory Circle(num x, num y, num radius) => new _Circle(x.toDouble(), y.toDouble(), radius.toDouble());
  
}


class _Circle implements Circle {
  
  double _x;
  double _y;
  double _radius;
  
  _Circle(this._x, this._y, this._radius);

  double get x => _x;
  double get y => _y;
  double get radius => _radius;
}
