part of cairodart.base;

abstract class Rectangle {
  
  int x;
  int y;
  int width;
  int height;
  
  factory Rectangle(int x, int y, int width, int height) => new _Rectangle(x, y, width, height);
  
}


class _Rectangle implements Rectangle {
  
  int x;
  int y;
  int width;
  int height;
  
  _Rectangle(this.x, this.y, this.width, this.height);
  
  @override
  operator==(Rectangle other) => x == other.x && y == other.y && width == other.width && height == other.height;
  
}