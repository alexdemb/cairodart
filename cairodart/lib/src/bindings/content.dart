part of cairodart.base;

abstract class Content {
  static Content CAIRO_CONTENT_COLOR = new _Content(0x1000);
  static Content CAIRO_CONTENT_ALPHA = new _Content(0x2000);
  static Content CAIRO_CONTENT_COLOR_ALPHA = new _Content(0x3000);
}


class _Content extends NativeFieldWrapperClass2 implements Content {
  
  final int _value;
  
  _Content(this._value) {
    _createContent(_value);
  }
  
  _createContent(int value) native 'create_cairo_content';
}