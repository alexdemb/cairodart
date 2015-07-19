part of cairodart.base;

abstract class Content {
  static Content Color = new _Content(0x1000);
  static Content Alpha = new _Content(0x2000);
  static Content ColorAndAlpha = new _Content(0x3000);
  
  int get value;
}

class _Content extends Content {
  
  final int _value;
  
  _Content(this._value);
  
  int get value => _value;
 
  @override
  operator==(Content other) => value == other.value;
}