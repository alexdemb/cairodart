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

abstract class HintStyle {
  static final HintStyle Default = new _HintStyle(0);
  static final HintStyle None = new _HintStyle(1);
  static final HintStyle Slight = new _HintStyle(2);
  static final HintStyle Medium = new _HintStyle(3);
  static final HintStyle Full = new _HintStyle(4);
  
  int get value;
}

class _HintStyle implements HintStyle {
  
  int _val;
  
  _HintStyle(this._val);
  
  int get value => _val;
  
  @override
  operator==(HintStyle other) => other.value == value;
  
}