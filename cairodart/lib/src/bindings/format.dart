part of cairodart.base;


class Format extends NativeFieldWrapperClass2 {
  static final Format CAIRO_FORMAT_INVALID = new Format._(-1);
  static final Format CAIRO_FORMAT_ARGB32 = new Format._(0);
  static final Format CAIRO_FORMAT_RGB24 = new Format._(1);
  static final Format CAIRO_FORMAT_A8 = new Format._(2);
  static final Format CAIRO_FORMAT_A1 = new Format._(3);
  static final Format CAIRO_FORMAT_RGB16_565 = new Format._(4);
  static final Format CAIRO_FORMAT_RGB30 = new Format._(5);
  
  final int value;
  
  Format._(this.value) {
    _createFormat(value);
  }
  
  _createFormat(int value) native 'create_cairo_format';
}