part of cairodart.base;

abstract class HintStyle {
  static final HintStyle Default = new _HintStyle(0);
  static final HintStyle None = new _HintStyle(1);
  static final HintStyle Slight = new _HintStyle(2);
  static final HintStyle Medium = new _HintStyle(3);
  static final HintStyle Full = new _HintStyle(4);
  
  int get value;
}

class _HintStyle implements HintStyle {
  
  int _val;
  
  _HintStyle(this._val);
  
  int get value => _val;
  
  @override
  operator==(HintStyle other) => other.value == value;
  
}