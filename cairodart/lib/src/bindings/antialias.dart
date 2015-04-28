part of cairodart.base;

abstract class Antialias {
  static final Antialias DEFAULT = new _Antialias(0);
  static final Antialias NONE = new _Antialias(1);
  static final Antialias GRAY = new _Antialias(2);
  static final Antialias SUBPIXEL = new _Antialias(3);
  static final Antialias FAST = new _Antialias(4);
  static final Antialias GOOD = new _Antialias(5);
  static final Antialias BEST = new _Antialias(6);
    
  int get value;
}

class _Antialias implements Antialias {
  int _val;
  
  _Antialias(this._val);
  
  int get value => _val;
  
  @override
  operator==(Antialias other) => value == other.value;  
}

