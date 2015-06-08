part of cairodart.base;

abstract class Format {
  static final Format INVALID = new _Format(-1);
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