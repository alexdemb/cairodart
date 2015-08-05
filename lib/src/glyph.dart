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

///
/// Holds information about a single glyph when drawing or measuring text.
///
/// A font is (in simple terms) a collection of shapes used to draw text.
/// A glyph is one of these shapes.
/// There can be multiple glyphs for a single character (alternates to be used in different contexts, for example),
/// or a glyph can be a ligature of multiple characters.
///
/// Note that the offsets given by x and y are not cumulative. When drawing or measuring text, each glyph is
/// individually positioned with respect to the overall origin.
///
abstract class Glyph {

  factory Glyph(int index, num x, num y) => new _Glyph(index, x.toDouble(), y.toDouble());

  /// Glyph index in the font. The exact interpretation of the glyph index depends on the font technology being used.
  int get index;

  ///
  /// The offset in the X direction between the origin used for drawing or measuring the string and the
  /// origin of this glyph.
  ///
  double get x;

  ///
  /// The offset in the Y direction between the origin used for drawing or measuring the string and the
  /// origin of this glyph.
  ///
  double get y;

}

class _Glyph implements Glyph {

  int _index;
  double _x;
  double _y;

  _Glyph(this._index, this._x, this._y);

  int get index => _index;
  double get x => _x;
  double get y => _y;

  @override
  operator==(Glyph other) => index == other.index && x == other.x && y == other.y;

}