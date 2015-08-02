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
/// Used to select how paths are filled.
///
/// For both fill rules, whether or not a point is included in the fill is determined by taking a
/// ray from that point to infinity and looking at intersections with the path.
///
/// The ray can be in any direction, as long as it doesn't pass through the end point of a segment or
/// have a tricky intersection such as intersecting tangent to the path.
///
/// (Note that filling is not actually implemented in this way.
/// This is just a description of the rule that is applied.)
///
/// The default fill rule is [FillRule.Winding].
///
/// New entries may be added in future versions.
///
abstract class FillRule {

  ///
  /// If the path crosses the ray from left-to-right, counts +1.
  /// If the path crosses the ray from right to left, counts -1.
  ///
  /// (Left and right are determined from the perspective of looking along the ray from the starting point.)
  ///
  /// If the total count is non-zero, the point will be filled.
  ///
  static final FillRule Winding = new _FillRule(0);

  ///
  /// Counts the total number of intersections, without regard to the orientation of the contour.
  ///
  /// If the total number of intersections is odd, the point will be filled.
  ///
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
