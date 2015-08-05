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

///
/// How a font should be rendered.
///
abstract class FontOptions implements RefObject {
  
  factory FontOptions() => new _FontOptions();
  factory FontOptions._internal() => new _FontOptions._internal();

  ///
  /// Allocates a new font options object copying the option values from this one.
  ///
  FontOptions copy();

  ///
  /// Merges non-default options from other into options, replacing existing values.
  ///
  /// This operation can be thought of as somewhat similar to compositing other onto options with the
  /// operation of [Operator.Over].
  ///
  void merge(FontOptions other);

  ///
  /// Compute a hash for the font options object; this value will be useful when storing an object containing
  /// a [FontOptions] in a hash table.
  ///
  int get hash;

  /// Gets or sets the antialiasing mode for the font options object
  Antialias antialias;

  ///
  /// Gets or sets the subpixel order for the font options object.
  ///
  /// The subpixel order specifies the order of color elements within each pixel on the display device when
  /// rendering with an antialiasing mode of [Antialias.Subpixel].
  ///
  SubpixelOrder subpixelOrder;

  ///
  /// Gets or sets the hint style for font outlines for the font options object.
  /// This controls whether to fit font outlines to the pixel grid, and if so,
  /// whether to optimize for fidelity or contrast.
  ///
  HintStyle hintStyle;

  ///
  /// Gets or sets the metrics hinting mode for the font options object.
  /// This controls whether metrics are quantized to integer values in device units.
  ///
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

