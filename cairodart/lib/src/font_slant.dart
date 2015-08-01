part of cairodart.base;

abstract class FontSlant {
  static final FontSlant Normal = new _FontSlant(0);
  static final FontSlant Italic = new _FontSlant(1);
  static final FontSlant Oblique = new _FontSlant(2);

  int get value;
}

class _FontSlant implements FontSlant {
  int _val;

  _FontSlant(this._val);


  int get value => _val;

  @override
  operator==(FontSlant other) => other.value == value;
}
