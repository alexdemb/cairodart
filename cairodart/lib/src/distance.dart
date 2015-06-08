part of cairodart.base;

abstract class Distance {
  
  factory Distance() => new _Distance(0.0, 0.0);
  factory Distance.from(double dx, double dy) => new _Distance(dx, dy);
    
  double get dx;
  double get dy;
}

class _Distance implements Distance {
  
  double _dx;
  double _dy;
  
  _Distance(this._dx, this._dy);
  
  double get dx => _dx;
  double get dy => _dy;
  
  @override
  operator==(Distance other) => dx == other.dx && dy == other.dy;  
}


