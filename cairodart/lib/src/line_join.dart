part of cairodart.base;

abstract class LineJoin {
  static final LineJoin Miter = new _LineJoin(0);
  static final LineJoin Round = new _LineJoin(1);
  static final LineJoin Bevel = new _LineJoin(2);
  
  int get value;
}

class _LineJoin implements LineJoin {
  
  int _val;
  
  _LineJoin(this._val);
  
  int get value => _val;
  
  @override
  operator==(LineJoin other) => other.value == value;
}

