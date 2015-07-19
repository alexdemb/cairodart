part of cairodart.base;

abstract class Operator {
  static final Operator Clear = new _Operator(0);
  static final Operator Source = new _Operator(1);
  static final Operator Over = new _Operator(2);
  static final Operator In = new _Operator(3);
  static final Operator Out = new _Operator(4);
  static final Operator Atop = new _Operator(5);
  static final Operator Dest = new _Operator(6);
  static final Operator DestOver = new _Operator(7);
  static final Operator DestIn = new _Operator(8);
  static final Operator DestOut = new _Operator(10);
  static final Operator DestAtop = new _Operator(11);
  static final Operator Xor = new _Operator(12);
  static final Operator Add = new _Operator(13);
  static final Operator Saturate = new _Operator(14);
  static final Operator Multiply = new _Operator(15);
  static final Operator Screen = new _Operator(16);
  static final Operator Overlay = new _Operator(17);
  static final Operator Darken = new _Operator(18);
  static final Operator Lighten = new _Operator(19);
  static final Operator ColorDodge = new _Operator(20);
  static final Operator ColorBurn = new _Operator(21);
  static final Operator HardLight = new _Operator(22);
  static final Operator SoftLight = new _Operator(23);
  static final Operator Difference = new _Operator(24);
  static final Operator Exclusion = new _Operator(25);
  static final Operator HSLHUE = new _Operator(26);
  static final Operator HSLSaturation = new _Operator(27);
  static final Operator HSLColor = new _Operator(28);
  static final Operator HSLLuminosity = new _Operator(29);
  
  
  int get value;
}

class _Operator implements Operator {
  int _val;
  
  _Operator(this._val);
  
  int get value => _val;
  
  @override
  operator==(Operator other) => other.value == value;
}
