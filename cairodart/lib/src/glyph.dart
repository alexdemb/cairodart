///
/// This library is free software; you can redistribute it and/or
/// modify it under the terms of the GNU Lesser General Public
/// License as published by the Free Software Foundation; either
/// version 2.1 of the License, or (at your option) any later version.
///
/// This library is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
/// Lesser General Public License for more details.
///
/// You should have received a copy of the GNU Lesser General Public
/// License along with this library; if not, write to the Free Software
/// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
/// MA 02110-1301  USA
///

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