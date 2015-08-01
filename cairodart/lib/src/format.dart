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

abstract class Format {
  static final Format Invalid = new _Format(-1);
  static final Format ARGB32 = new _Format(0);
  static final Format RGB24 = new _Format(1);
  static final Format A8 = new _Format(2);
  static final Format A1 = new _Format(3);
  static final Format RGB16_565 = new _Format(4);
  static final Format RGB30 = new _Format(5);
    
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