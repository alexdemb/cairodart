part of cairodart.base;

abstract class FillRule {
  static final FillRule Winding = new _FillRule(0);
  static final FillRule EvenOdd = new _FillRule(1);
  
  int get value;
}

class _FillRule implements FillRule {
  int _val;
  
  _FillRule(this._val);
  
  
  int get value => _val;
  
  @override
  operator==(FillRule other) => other.value == value;
}
