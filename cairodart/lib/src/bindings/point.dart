part of cairodart.base;

abstract class Point {
  
  factory Point() => new _Point(0.0, 0.0);
  factory Point.from(num x, num y) => new _Point(x, y);
    
  num get x;
  num get y;
}

class _Point implements Point {
  
  num _x;
  num _y;
  
  _Point(this._x, this._y);
  
  num get x => _x;
  num get y => _y;
  
  @override
  operator==(Point other) => x == other.x && y == other.y;
}


