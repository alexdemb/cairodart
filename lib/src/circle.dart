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
/// Represents a circle.
///
/// Circle position can be obtained by [x] and [y] property.
/// Radius can be obtained by [radius] property.
///
abstract class Circle {

  /// Circle X-coordinate
  double get x;

  /// Circle Y-coordinate
  double get y;

  /// Circle radius
  double get radius;
  
  factory Circle(num x, num y, num radius) => new _Circle(x.toDouble(), y.toDouble(), radius.toDouble());
  
}


class _Circle implements Circle {
  
  double _x;
  double _y;
  double _radius;
  
  _Circle(this._x, this._y, this._radius);

  double get x => _x;
  double get y => _y;
  double get radius => _radius;
}
