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

abstract class SubpixelOrder {
  static final SubpixelOrder Default = new _SubpixelOrder(0);
  static final SubpixelOrder Rgb = new _SubpixelOrder(1);
  static final SubpixelOrder Bgr = new _SubpixelOrder(2);
  static final SubpixelOrder Vrgb = new _SubpixelOrder(3);
  static final SubpixelOrder Vbgr = new _SubpixelOrder(4);
  
  int get value;
}

class _SubpixelOrder implements SubpixelOrder {
  
  int _val;
  
  _SubpixelOrder(this._val);
  
  int get value => _val;
  
  @override
  operator==(SubpixelOrder other) => other.value == value;
  
}