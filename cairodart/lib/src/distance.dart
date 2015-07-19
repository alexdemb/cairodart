part of cairodart.base;

abstract class Distance {
  
  factory Distance() => new _Distance(0.0, 0.0);
  factory Distance.from(num dx, num dy) => new _Distance(dx.toDouble(), dy.toDouble());
    
  num get dx;
  num get dy;
}

class _Distance implements Distance {
  
  num _dx;
  num _dy;
  
  _Distance(this._dx, this._dy);
  
  num get dx => _dx;
  num get dy => _dy;
  
  @override
  operator==(Distance other) => dx == other.dx && dy == other.dy;  
}


