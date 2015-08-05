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
/// Specifies how to render the endpoints of the path when stroking.
///
abstract class LineCap {

  /// Start(stop) the line exactly at the start(end) point
  static final LineCap Butt = new _LineCap(0);

  /// Use a round ending, the center of the circle is the end point
  static final LineCap Round = new _LineCap(1);

  /// Use squared ending, the center of the square is the end point
  static final LineCap Square = new _LineCap(2);
  
  int get value;
}

class _LineCap implements LineCap {
  int _val;
  
  _LineCap(this._val);
  
  int get value => _val;
  
  @override
  operator==(LineCap other) => other.value == value; 
}