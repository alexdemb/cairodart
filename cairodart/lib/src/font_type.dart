part of cairodart.base;

abstract class FontType {
  static final FontType Toy = new _FontType(0);
  static final FontType FreeType = new _FontType(1);
  static final FontType Win32 = new _FontType(2);
  static final FontType Quartz = new _FontType(3);
  static final FontType User = new _FontType(4);
  
  int get value;
}

class _FontType implements FontType {

  int _val;
  
  int get value => _val;
  
  _FontType(this._val);
  
  @override
  operator==(FontType other) => other.value == value;
}

