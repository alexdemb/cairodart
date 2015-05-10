part of cairodart.base;

abstract class FontFace {

  factory FontFace._internal() => new _FontFace();
  
  FontType get type;
  
}

class _FontFace implements FontFace {
  
  FontType get type native 'font_face_get_type';
  
}

