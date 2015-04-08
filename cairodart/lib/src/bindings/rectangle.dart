part of cairodart.base;

abstract class Rectangle {
  
  num x;
  num y;
  num width;
  num height;
  
  factory Rectangle(num x, num y, num width, num height) => new _Rectangle(x, y, width, height);
  
}


class _Rectangle implements Rectangle {
  
  num x;
  num y;
  num width;
  num height;
  
  _Rectangle(this.x, this.y, this.width, this.height);
  
  @override
  operator==(Rectangle other) => x == other.x && y == other.y && width == other.width && height == other.height;
  
}