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
/// Represents a point.
///
abstract class Point {

  ///
  /// Creates a point with (0, 0) coordinates.
  ///
  factory Point() => new _Point(0.0, 0.0);

  ///
  /// Creates a point using specified x and y coordinates.
  ///
  factory Point.from(num x, num y) => new _Point(x, y);

  /// Gets point X coordinate
  num get x;

  /// Gets point Y coordinate
  num get y;
}

class _Point implements Point {
  
  num _x;
  num _y;
  
  _Point(this._x, this._y);
  
  num get x => _x;
  num get y => _y;
  
  @override
  operator==(Point other) => x == other.x && y == other.y;
  
  @override
  String toString() => "($x, $y)";
}


