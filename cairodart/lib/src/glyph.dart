part of cairodart.base;

abstract class Glyph {

  factory Glyph(int index, double x, double y) => new _Glyph(index, x, y);

  int get index;
  double get x;
  double get y;

}

class _Glyph implements Glyph {

  int _index;
  int _x;
  int _y;

  _Glyph(this._index, this._x, this._y);

  int get index => _index;
  double get x => _x;
  double get y => _y;

  @override
  operator==(Glyph other) => index == other.index && x == other.x && y == other.y;

}