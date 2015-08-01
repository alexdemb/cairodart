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

