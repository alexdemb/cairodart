part of cairodart.base;

abstract class Extend {
  static Extend None = new _Extend(0);
  static Extend Repeat = new _Extend(1);
  static Extend Reflect = new _Extend(2);
  static Extend Pad = new _Extend(3);
  
  int get value;
}

class _Extend implements Extend {
  int _val;
  
  _Extend(this._val);
  
  int get value => _val;
  
  @override 
  operator==(Extend other) => value == other.value;
}