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
/// Font face at particular size and options.
///
abstract class ScaledFont implements RefObject {

  ///
  /// Creates a scaled font object from a font face and matrices that describe the size of the font and the
  /// environment in which it will be used.
  ///
  factory ScaledFont(FontFace fontFace, Matrix fontMatrix, Matrix ctm, FontOptions options) =>
      new _ScaledFont(fontFace, fontMatrix, ctm, options);

  ///
  /// Gets the metrics for a font.
  ///
  FontExtents get fontExtents;

  ///
  /// Gets the extents for a string of text.
  ///
  /// The extents describe a user-space rectangle that encloses the "inked" portion of the text drawn at the
  /// origin (0,0) (as it would be drawn by [Context.showText()] if the cairo graphics state were set to the
  /// same [fontFace], [fontMatrix], [ctm], and [fontOptions] as scaled font).
  ///
  /// Additionally, the [TextExtents.xAdvance] and [TextExtents.yAdvance] values indicate the amount by which
  /// the current point would be advanced by [Context.showText()].
  ///
  /// Note that whitespace characters do not directly contribute to the size of the rectangle
  /// (extents.width and extents.height).
  ///
  /// They do contribute indirectly by changing the position of non-whitespace characters.
  /// In particular, trailing whitespace characters are likely to not affect the size of the rectangle,
  /// though they will affect the [TextExtents.xAdvance] and [TextExtents.yAdvance] values.
  ///
  TextExtents get textExtents;

  ///
  /// Gets the extents for an array of glyphs.
  ///
  /// The extents describe a user-space rectangle that encloses the "inked" portion of the glyphs,
  ///
  /// Note that whitespace glyphs do not contribute to the size of the rectangle (extents.width and extents.height).
  ///
  TextExtents get glyphExtents;

  ///
  /// Gets the font face that this scaled font uses.
  ///
  /// This might be the font face passed to the constructor, but this does not hold true for all possible cases.
  ///
  FontFace get fontFace;

  ///
  /// Gets the font options with which object was created.
  ///
  FontOptions get fontOptions;

  ///
  /// Gets the font matrix with which object was created.
  ///
  Matrix get fontMatrix;

  ///
  /// Gets the CTM with which object was created.
  ///
  /// Note that the translation offsets (x0, y0) of the CTM are ignored by constructor of [ScaledFont].
  /// So, the matrix this function returns always has 0, 0 as x0, y0.
  ///
  Matrix get ctm;

  ///
  /// Gets the scale matrix.
  ///
  /// The scale matrix is product of the font matrix and the ctm associated with the scaled font,
  /// and hence is the matrix mapping from font space to device space.
  ///
  Matrix get scaleMatrix;

  ///
  /// Gets the type of the backend used to create a scaled font
  ///
  FontType get fontType;

}

class _ScaledFont extends NativeFieldWrapperClass2 implements ScaledFont {
  
  _ScaledFont(FontFace fontFace, Matrix fontMatrix, Matrix ctm, FontOptions options) {
    _createScaledFont(fontFace, fontMatrix, ctm, options);
  }
  
  void _createScaledFont(FontFace fontFace, Matrix fontMatrix, Matrix ctm, FontOptions options) native 'scaled_font_create';
  
  FontExtents get fontExtents native 'scaled_font_extents';
  TextExtents get textExtents native 'scaled_font_text_extents';
  TextExtents get glyphExtents native 'scaled_font_glyph_extents';
  FontFace get fontFace native 'scaled_font_get_font_face';
  FontOptions get fontOptions native 'scaled_font_get_font_options';
  Matrix get fontMatrix native 'scaled_font_get_font_matrix';
  Matrix get ctm native 'scaled_font_get_ctm';
  Matrix get scaleMatrix native 'scaled_font_get_scale_matrix';
  FontType get fontType native 'scaled_font_get_type';
  CairoStatus get status native 'scaled_font_status';

}

