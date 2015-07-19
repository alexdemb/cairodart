part of cairodart.base;

abstract class FontOptions implements RefObject {
  
  factory FontOptions() => new _FontOptions();
  factory FontOptions._internal() => new _FontOptions._internal();
  
  FontOptions copy();
  void merge(FontOptions other);
  int get hash;
  
  Antialias antialias;
  SubpixelOrder subpixelOrder;
  HintStyle hintStyle;
  HintMetrics hintMetrics;
  
}

class _FontOptions extends NativeFieldWrapperClass2 implements FontOptions {
  
  _FontOptions._internal(){}
  
  _FontOptions() {
    _create();
  }
  
  void _create() native 'font_options_create';
  
  FontOptions copy() native 'font_options_copy';
  void merge(FontOptions other) native 'font_options_merge';
  int get hash native 'font_options_hash';
  
  Antialias get antialias native 'font_options_get_antialias';
  void set antialias(Antialias antialias) => _setAntialias(antialias.value);
  
  void _setAntialias(int value) native 'font_options_set_antialias';
  
  SubpixelOrder get subpixelOrder native 'font_options_get_subpixel_order';
  void set subpixelOrder(SubpixelOrder order) => _setSubpixelOrder(order.value);
  
  void _setSubpixelOrder(int value) native 'font_options_set_subpixel_order';
  
  HintStyle get hintStyle native 'font_options_get_hint_style';
  void set hintStyle(HintStyle style) => _setHintStyle(style.value);
  
  void _setHintStyle(int value) native 'font_options_set_hint_style';
  
  HintMetrics get hintMetrics native 'font_options_get_hint_metrics';
  
  void set hintMetrics(HintMetrics metrics) => _setHintMetrics(metrics.value);
  
  void _setHintMetrics(int value) native 'font_options_set_hint_metrics';

  CairoStatus get status native 'font_options_status';

  @override
  operator==(FontOptions other) native 'font_options_equal';
  
}

