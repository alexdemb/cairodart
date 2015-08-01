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

abstract class Filter {
  static final Filter Fast = new _Filter(0);
  static final Filter Good = new _Filter(1);
  static final Filter Best = new _Filter(2);
  static final Filter Nearest = new _Filter(3);
  static final Filter Bilinear = new _Filter(4);
  static final Filter Gaussian = new _Filter(5);
  
  int get value;
}

class _Filter implements Filter {
  
  int _val;
  
  _Filter(this._val);
  
  int get value => _val;
  
  @override
  operator==(Filter other) => value == other.value; 
}