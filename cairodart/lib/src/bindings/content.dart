part of cairodart.base;

abstract class Content extends NativeFieldWrapperClass2 {
  static Content CAIRO_CONTENT_COLOR = new _Content(0x1000);
  static Content CAIRO_CONTENT_ALPHA = new _Content(0x2000);
  static Content CAIRO_CONTENT_COLOR_ALPHA = new _Content(0x3000);
  
  static Map<int, Content> _PREDEFINED = {
     Content.CAIRO_CONTENT_ALPHA.value: Content.CAIRO_CONTENT_ALPHA,
     Content.CAIRO_CONTENT_COLOR.value: Content.CAIRO_CONTENT_COLOR,
     Content.CAIRO_CONTENT_COLOR_ALPHA.value: Content.CAIRO_CONTENT_COLOR_ALPHA
  };
  
  static Content valueOf(int val) => _PREDEFINED.containsKey(val) ? _PREDEFINED[val] : null;
  
  int get value;
}

class _Content extends Content {
  
  final int _value;
  
  _Content(this._value) {
    _createContent(_value);
  }
  
  int get value => _value;
  
  _createContent(int value) native 'create_cairo_content';
}