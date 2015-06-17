part of cairodart.base;

abstract class FontFace {

  factory FontFace._internal() => new _FontFace();

  factory FontFace.userFont() => new _FontFace.userFont();
  
  FontType get type;
  
}

class _FontFace extends NativeFieldWrapperClass2 implements FontFace {
  
  FontType get type native 'font_face_get_type';

  _FontFace.userFont() {
    _createUserFont();
  }

  _createUserFont() native 'user_font_face_create';
  
}

