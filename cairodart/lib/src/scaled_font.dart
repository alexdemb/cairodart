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

abstract class ScaledFont implements RefObject {
  
  factory ScaledFont(FontFace fontFace, Matrix fontMatrix, Matrix ctm, FontOptions options) =>
      new _ScaledFont(fontFace, fontMatrix, ctm, options);
  
  FontExtents get fontExtents;
  TextExtents get textExtents;
  TextExtents get glyphExtents;
  FontFace get fontFace;
  FontOptions get fontOptions;
  Matrix get fontMatrix;
  Matrix get ctm;
  Matrix get scaleMatrix;
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

