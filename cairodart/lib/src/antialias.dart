part of cairodart.base;

abstract class Antialias {
  static final Antialias Default = new _Antialias(0);
  static final Antialias None = new _Antialias(1);
  static final Antialias Gray = new _Antialias(2);
  static final Antialias Subpixel = new _Antialias(3);
  static final Antialias Fast = new _Antialias(4);
  static final Antialias Good = new _Antialias(5);
  static final Antialias Best = new _Antialias(6);
    
  int get value;
}

class _Antialias implements Antialias {
  int _val;
  
  _Antialias(this._val);
  
  int get value => _val;
  
  @override
  operator==(Antialias other) => value == other.value;  
}

