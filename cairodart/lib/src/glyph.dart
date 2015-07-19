part of cairodart.base;

abstract class Glyph {

  factory Glyph(int index, num x, num y) => new _Glyph(index, x, y);

  int get index;
  num get x;
  num get y;

}

class _Glyph implements Glyph {

  int _index;
  int _x;
  int _y;

  _Glyph(this._index, this._x, this._y);

  int get index => _index;
  num get x => _x;
  num get y => _y;

  @override
  operator==(Glyph other) => index == other.index && x == other.x && y == other.y;

}