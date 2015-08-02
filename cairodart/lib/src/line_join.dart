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
/// Specifies how to render the junction of two lines when stroking.
///
abstract class LineJoin {

  /// Use a sharp (angled) corner
  static final LineJoin Miter = new _LineJoin(0);

  /// Use a rounded join, the center of the circle is the joint point
  static final LineJoin Round = new _LineJoin(1);

  /// Use a cut-off join, the join is cut off at half the line width from the joint point
  static final LineJoin Bevel = new _LineJoin(2);
  
  int get value;
}

class _LineJoin implements LineJoin {
  
  int _val;
  
  _LineJoin(this._val);
  
  int get value => _val;
  
  @override
  operator==(LineJoin other) => other.value == value;
}

