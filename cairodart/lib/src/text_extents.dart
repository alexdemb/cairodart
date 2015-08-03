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
/// The [TextExtents] structure stores the extents of a single glyph or a string of glyphs in
/// user-space coordinates.
///
/// Because text extents are in user-space coordinates, they are mostly, but not entirely, independent of
/// the current transformation matrix.
///
/// They will change slightly due to hinting (so you can't assume that metrics are independent of
/// the transformation matrix), but otherwise will remain unchanged.
///
///
abstract class TextExtents {

  ///
  /// The horizontal distance from the origin to the leftmost part of the glyphs as drawn.
  /// Positive if the glyphs lie entirely to the right of the origin.
  ///
  double xBearing;

  ///
  /// The vertical distance from the origin to the topmost part of the glyphs as drawn.
  /// Positive only if the glyphs lie completely below the origin; will usually be negative.
  ///
  double yBearing;

  /// Width of the glyphs as drawn
  double width;

  /// Height of the glyphs as drawn
  double height;

  /// Distance to advance in the X direction after drawing these glyphs
  double xAdvance;

  ///
  /// Distance to advance in the Y direction after drawing these glyphs.
  /// Will typically be zero except for vertical text layout as found in East-Asian languages.
  ///
  double yAdvance;  
}

class _TextExtents implements TextExtents {
  double xBearing;
  double yBearing;
  double width;
  double height;
  double xAdvance;
  double yAdvance;    
  
  _TextExtents(this.xBearing, this.yBearing, this.width, this.height, this.xAdvance, this.yAdvance);
  
  @override
  operator==(TextExtents other) =>
      other.xBearing == xBearing &&
      other.yBearing == yBearing &&
      other.width == width &&
      other.height == height &&
      other.xAdvance == xAdvance &&
      other.yAdvance == yAdvance;
}
