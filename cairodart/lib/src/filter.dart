part of cairodart.base;

abstract class Filter {
  static final Filter Fast = new _Filter(0);
  static final Filter Good = new _Filter(1);
  static final Filter Best = new _Filter(2);
  static final Filter Nearest = new _Filter(3);
  static final Filter Bilinear = new _Filter(4);
  static final Filter Gaussian = new _Filter(5);
  
  int get value;
}

class _Filter implements Filter {
  
  int _val;
  
  _Filter(this._val);
  
  int get value => _val;
  
  @override
  operator==(Filter other) => value == other.value; 
}