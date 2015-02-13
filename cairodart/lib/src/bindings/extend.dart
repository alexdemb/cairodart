part of cairodart.base;

abstract class Extend {
  static Extend NONE = new _Extend(0);
  static Extend REPEAT = new _Extend(1);
  static Extend REFLECT = new _Extend(2);
  static Extend PAD = new _Extend(3);
  
  int get value;
}

class _Extend implements Extend {
  int _val;
  
  _Extend(this._val);
  
  int get value => _val;
  
  @override 
  operator==(Extend other) {
    return value == other.value;
  }
}