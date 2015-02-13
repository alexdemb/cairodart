part of cairodart.base;

abstract class PatternType {
  static final PatternType SOLID = new _PatternType(0);
  static final PatternType SURFACE = new _PatternType(1);
  static final PatternType LINEAR = new _PatternType(2);
  static final PatternType RADIAL = new _PatternType(3);
  static final PatternType MESH = new _PatternType(4);
  static final PatternType RASTER_SOURCE = new _PatternType(5);
  
  int get value;
}

class _PatternType implements PatternType {
  int _val;
  
  _PatternType(this._val);
  
  int get value => _val;
  
  @override
  operator==(PatternType other) => value == other.value;
}