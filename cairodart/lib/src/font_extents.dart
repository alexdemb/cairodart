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
/// Stores metric information for a font.
///
/// Values are given in the current user-space coordinate system.
/// Because font metrics are in user-space coordinates, they are mostly, but not entirely,
/// independent of the current transformation matrix.
///
abstract class FontExtents {

  ///
  /// The distance that the font extends above the baseline.
  ///
  /// Note that this is not always exactly equal to the maximum of the extents of all the glyphs in the font,
  /// but rather is picked to express the font designer's intent as to how the font should align
  /// with elements above it.
  ///
  double ascent;

  ///
  /// The distance that the font extends below the baseline.
  ///
  /// This value is positive for typical fonts that include portions below the baseline. Note that this is
  /// not always exactly equal to the maximum of the extents of all the glyphs in the font,
  /// but rather is picked to express the font designer's intent as to how the font
  /// should align with elements below it.
  ///
  double descent;

  ///
  /// the recommended vertical distance between baselines when setting consecutive lines of text with the font.
  ///
  /// This is greater than ascent +descent by a quantity known as the line spacing or external leading.
  /// When space is at a premium, most fonts can be set with only a distance of ascent +descent between lines.
  ///
  double height;

  ///
  /// The maximum distance in the X direction that the origin is advanced for any glyph in the font.
  ///
  double maxXAdvance;

  ///
  /// The maximum distance in the Y direction that the origin is advanced for any glyph in the font.
  /// This will be zero for normal fonts used for horizontal writing.
  /// (The scripts of East Asia are sometimes written vertically.)
  ///
  double maxYAdvance;
}

class _FontExtents implements FontExtents {
  double ascent;
  double descent;
  double height;
  double maxXAdvance;
  double maxYAdvance;
  
  _FontExtents(this.ascent, this.descent, this.height, this.maxXAdvance, this.maxYAdvance);
  
  @override
  operator==(FontExtents other) =>
      other.ascent == ascent &&
      other.descent == descent &&
      other.height == height &&
      other.maxXAdvance == maxXAdvance &&
      other.maxYAdvance == maxYAdvance;
    
}
