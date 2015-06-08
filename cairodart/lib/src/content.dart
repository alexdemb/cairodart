part of cairodart.base;

abstract class Content extends NativeFieldWrapperClass2 {
  static Content COLOR = new _Content(0x1000);
  static Content ALPHA = new _Content(0x2000);
  static Content COLOR_ALPHA = new _Content(0x3000);
  
  int get value;
}

class _Content extends Content {
  
  final int _value;
  
  _Content(this._value);
  
  int get value => _value;
 
  @override
  operator==(Content other) => value == other.value;
}