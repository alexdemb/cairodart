part of cairodart.base;

abstract class Format {
  static final Format CAIRO_FORMAT_INVALID = new _Format(-1);
  static final Format CAIRO_FORMAT_ARGB32 = new _Format(0);
  static final Format CAIRO_FORMAT_RGB24 = new _Format(1);
  static final Format CAIRO_FORMAT_A8 = new _Format(2);
  static final Format CAIRO_FORMAT_A1 = new _Format(3);
  static final Format CAIRO_FORMAT_RGB16_565 = new _Format(4);
  static final Format CAIRO_FORMAT_RGB30 = new _Format(5);
    
  int strideForWidth(int width);
}


class _Format extends NativeFieldWrapperClass2 implements Format {
  final int value;
  
  _Format(this.value) {
    _createFormat(value);
  }
  
  _createFormat(int value) native 'create_cairo_format';
  
  int strideForWidth(int width) native 'format_stride_for_width';
}