part of cairodart.base;

abstract class PatternType {
  static final PatternType Solid = new _PatternType(0);
  static final PatternType Surface = new _PatternType(1);
  static final PatternType Linear = new _PatternType(2);
  static final PatternType Radial = new _PatternType(3);
  static final PatternType Mesh = new _PatternType(4);
  static final PatternType RasterSource = new _PatternType(5);
  
  int get value;
}

class _PatternType implements PatternType {
  int _val;
  
  _PatternType(this._val);
  
  int get value => _val;
  
  @override
  operator==(PatternType other) => value == other.value;
}