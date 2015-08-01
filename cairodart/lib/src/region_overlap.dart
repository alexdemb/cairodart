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

abstract class RegionOverlap {
  static final RegionOverlap OverlapIn = new _RegionOverlap(0);
  static final RegionOverlap OverlapOut = new _RegionOverlap(1);
  static final RegionOverlap OverlapPart = new _RegionOverlap(2);
  
  int get value;
}

class _RegionOverlap implements RegionOverlap {
  
  int _val;
  
  int get value => _val;
  
  _RegionOverlap(this._val);
  
  @override
  operator==(RegionOverlap other) => other.value == value;
}