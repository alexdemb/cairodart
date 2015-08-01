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

abstract class Content {
  static Content Color = new _Content(0x1000);
  static Content Alpha = new _Content(0x2000);
  static Content ColorAndAlpha = new _Content(0x3000);
  
  int get value;
}

class _Content extends Content {
  
  final int _value;
  
  _Content(this._value);
  
  int get value => _value;
 
  @override
  operator==(Content other) => value == other.value;
}