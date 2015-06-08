part of cairodart.base;

abstract class Filter {
  static final Filter FAST = new _Filter(0);
  static final Filter GOOD = new _Filter(1);
  static final Filter BEST = new _Filter(2);
  static final Filter NEAREST = new _Filter(3);
  static final Filter BILINEAR = new _Filter(4);
  static final Filter GAUSSIAN = new _Filter(5);
  
  int get value;
}

class _Filter implements Filter {
  
  int _val;
  
  _Filter(this._val);
  
  int get value => _val;
  
  @override
  operator==(Filter other) => value == other.value; 
}