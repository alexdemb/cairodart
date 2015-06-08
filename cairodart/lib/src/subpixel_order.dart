part of cairodart.base;

abstract class SubpixelOrder {
  static final SubpixelOrder Default = new _SubpixelOrder(0);
  static final SubpixelOrder Rgb = new _SubpixelOrder(1);
  static final SubpixelOrder Bgr = new _SubpixelOrder(2);
  static final SubpixelOrder Vrgb = new _SubpixelOrder(3);
  static final SubpixelOrder Vbgr = new _SubpixelOrder(4);
  
  int get value;
}

class _SubpixelOrder implements SubpixelOrder {
  
  int _val;
  
  _SubpixelOrder(this._val);
  
  int get value => _val;
  
  @override
  operator==(SubpixelOrder other) => other.value == value;
  
}