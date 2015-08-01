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

abstract class Antialias {
  static final Antialias Default = new _Antialias(0);
  static final Antialias None = new _Antialias(1);
  static final Antialias Gray = new _Antialias(2);
  static final Antialias Subpixel = new _Antialias(3);
  static final Antialias Fast = new _Antialias(4);
  static final Antialias Good = new _Antialias(5);
  static final Antialias Best = new _Antialias(6);
    
  int get value;
}

class _Antialias implements Antialias {
  int _val;
  
  _Antialias(this._val);
  
  int get value => _val;
  
  @override
  operator==(Antialias other) => value == other.value;  
}

