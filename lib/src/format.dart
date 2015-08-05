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
/// Used to identify the memory format of image data.
///
abstract class Format {

  /// No such format exists or is supported
  static final Format Invalid = new _Format(-1);

  ///
  /// Each pixel is a 32-bit quantity, with alpha in the upper 8 bits, then red, then green, then blue.
  ///
  /// The 32-bit quantities are stored native-endian. Pre-multiplied alpha is used.
  /// (That is, 50% transparent red is 0x80800000, not 0x80ff0000.)
  ///
  static final Format ARGB32 = new _Format(0);

  ///
  /// Each pixel is a 32-bit quantity, with the upper 8 bits unused.
  ///
  /// Red, Green, and Blue are stored in the remaining 24 bits in that order.
  ///
  static final Format RGB24 = new _Format(1);

  ///
  /// Each pixel is a 8-bit quantity holding an alpha value.
  ///
  static final Format A8 = new _Format(2);

  ///
  /// Each pixel is a 1-bit quantity holding an alpha value.
  ///
  /// Pixels are packed together into 32-bit quantities.
  /// The ordering of the bits matches the endianess of the platform.
  /// On a big-endian machine, the first pixel is in the uppermost bit,
  /// on a little-endian machine the first pixel is in the least-significant bit.
  ///
  static final Format A1 = new _Format(3);

  ///
  /// Each pixel is a 16-bit quantity with red in the upper 5 bits,
  /// then green in the middle 6 bits, and blue in the lower 5 bits.
  ///
  static final Format RGB16_565 = new _Format(4);

  /// Like RGB24 but with 10bpc.
  static final Format RGB30 = new _Format(5);

  ///
  /// This method provides a stride value that will respect all alignment requirements of the accelerated
  /// image-rendering code within cairo.
  ///
  int strideForWidth(int width);

  int get value;
}


class _Format extends NativeFieldWrapperClass2 implements Format {
  int _val;
  
  _Format(this._val);
  
  _createFormat(int value) native 'create_cairo_format';
  
  int strideForWidth(int width) => _strideForWidth(value, width); 
  int _strideForWidth(int value, int width) native 'format_stride_for_width';
  
  int get value => _val;
}