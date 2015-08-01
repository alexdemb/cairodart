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

abstract class FillRule {
  static final FillRule Winding = new _FillRule(0);
  static final FillRule EvenOdd = new _FillRule(1);
  
  int get value;
}

class _FillRule implements FillRule {
  int _val;
  
  _FillRule(this._val);
  
  
  int get value => _val;
  
  @override
  operator==(FillRule other) => other.value == value;
}
