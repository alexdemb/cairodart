part of cairodart.base;

abstract class Operator {
  static final Operator CLEAR = new _Operator(0);
  static final Operator SOURCE = new _Operator(1);
  static final Operator OVER = new _Operator(2);
  static final Operator IN = new _Operator(3);
  static final Operator OUT = new _Operator(4);
  static final Operator ATOP = new _Operator(5);
  static final Operator DEST = new _Operator(6);
  static final Operator DEST_OVER = new _Operator(7);
  static final Operator DEST_IN = new _Operator(8);
  static final Operator DEST_OUT = new _Operator(10);
  static final Operator DEST_ATOP = new _Operator(11);
  static final Operator XOR = new _Operator(12);
  static final Operator ADD = new _Operator(13);
  static final Operator SATURATE = new _Operator(14);
  static final Operator MULTIPLY = new _Operator(15);
  static final Operator SCREEN = new _Operator(16);
  static final Operator OVERLAY = new _Operator(17);
  static final Operator DARKEN = new _Operator(18);
  static final Operator LIGHTEN = new _Operator(19);
  static final Operator COLOR_DODGE = new _Operator(20);
  static final Operator COLOR_BURN = new _Operator(21);
  static final Operator HARD_LIGHT = new _Operator(22);
  static final Operator SOFT_LIGHT = new _Operator(23);
  static final Operator DIFFERENCE = new _Operator(24);
  static final Operator EXCLUSION = new _Operator(25);
  static final Operator HSL_HUE = new _Operator(26);
  static final Operator HSL_SATURATION = new _Operator(27);
  static final Operator HSL_COLOR = new _Operator(28);
  static final Operator HSL_LUMINOSITY = new _Operator(29);
  
  
  int get value;
}

class _Operator implements Operator {
  int _val;
  
  _Operator(this._val);
  
  int get value => _val;
  
  @override
  operator==(Operator other) => other.value == value;
}
