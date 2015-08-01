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

abstract class Rectangle {
  
  num x;
  num y;
  num width;
  num height;
  
  factory Rectangle(num x, num y, num width, num height) => new _Rectangle(x, y, width, height);
  
}


class _Rectangle implements Rectangle {
  
  num x;
  num y;
  num width;
  num height;
  
  _Rectangle(this.x, this.y, this.width, this.height);
  
  @override
  operator==(Rectangle other) => x == other.x && y == other.y && width == other.width && height == other.height;
  
  @override
  String toString() => '[x: $x, y: $y, width: $width, height: $height]';
}