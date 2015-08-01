part of cairodart.base;

abstract class FontWeight {
  static final FontWeight Normal = new _FontWeight(0);
  static final FontWeight Bold = new _FontWeight(1);

  int get value;
}

class _FontWeight implements FontWeight {
  int _val;

  _FontWeight(this._val);


  int get value => _val;

  @override
  operator==(FontWeight other) => other.value == value;
}
