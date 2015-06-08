part of cairodart.base;

abstract class LineCap {
  static final LineCap BUTT = new _LineCap(0);
  static final LineCap ROUND = new _LineCap(1);
  static final LineCap SQUARE = new _LineCap(2);
  
  int get value;
}

class _LineCap implements LineCap {
  int _val;
  
  _LineCap(this._val);
  
  int get value => _val;
  
  @override
  operator==(LineCap other) => other.value == value; 
}