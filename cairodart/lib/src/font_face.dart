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

  /// Gets the type of the backend used to create a font face.
  FontType get type;
  
}

class _FontFace extends NativeFieldWrapperClass2 implements FontFace {
  
  FontType get type native 'font_face_get_type';

  CairoStatus get status native 'font_face_status';
}

