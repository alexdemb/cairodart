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
/// Base class for font faces
///
abstract class FontFace implements RefObject {

  factory FontFace._internal() => new _FontFace();

  ///
  /// Creates a font face from a triplet of family, slant, and weight.
  ///
  /// These font faces are used in implementation of the the cairo "toy" font API.
  ///
  /// If family is the zero-length string "", the platform-specific default family is assumed.
  /// The default family then can be queried using [family].
  /// The [Context.selectFontFace()] method uses this to create font faces. See that method for limitations and
  /// other details of toy font faces.
  ///
  factory FontFace.toy(String family, FontSlant slant, FontWeight weight) => new _FontFace.toy(family, slant, weight);

  /// Gets the type of the backend used to create a font face.
  FontType get type;

  ///
  /// Gets the familly name of a toy font.
  ///
  String get family;

  ///
  /// Gets the slant a toy font.
  ///
  FontSlant get slant;

  ///
  /// Gets the weight a toy font.
  ///
  FontWeight get weight;
  
}

class _FontFace extends NativeFieldWrapperClass2 implements FontFace {

  _FontFace() {}

  _FontFace.toy(String family, FontSlant slant, FontWeight weight) {
    _createToyFont(family, slant.value, weight.value);
  }

  void _createToyFont(String family, int slant, int wieght) native 'toy_font_face_create';

  FontType get type native 'font_face_get_type';

  CairoStatus get status native 'font_face_status';

  String get family native 'toy_font_face_get_family';

  FontSlant get slant native 'toy_font_face_get_slant';

  FontWeight get weight native 'toy_font_face_get_weight';
}

