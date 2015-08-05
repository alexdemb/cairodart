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
/// Used to set the compositing operator for all cairo drawing operations.
///
/// The default operator is [Over].
/// The operators marked as unbounded modify their destination even outside of the mask layer
/// (that is, their effect is not bound by the mask layer).
///
/// However, their effect can still be limited by way of clipping.
/// To keep things simple, the operator descriptions here document the behavior for when both source and
/// destination are either fully transparent or fully opaque.
///
///
abstract class Operator {

  /// Clear destination layer (bounded)
  static final Operator Clear = new _Operator(0);

  /// Replace destination layer (bounded)
  static final Operator Source = new _Operator(1);

  /// Draw source layer on top of destination layer (bounded)
  static final Operator Over = new _Operator(2);

  /// Draw source where there was destination content (unbounded)
  static final Operator In = new _Operator(3);

  /// Draw source where there was no destination content (unbounded)
  static final Operator Out = new _Operator(4);

  /// Draw source on top of destination content and only there
  static final Operator Atop = new _Operator(5);

  /// Ignore the source
  static final Operator Dest = new _Operator(6);

  /// Draw destination on top of source
  static final Operator DestOver = new _Operator(7);

  /// Leave destination only where there was source content (unbounded)
  static final Operator DestIn = new _Operator(8);

  /// Leave destination only where there was no source content
  static final Operator DestOut = new _Operator(10);

  /// Leave destination on top of source content and only there (unbounded)
  static final Operator DestAtop = new _Operator(11);

  /// Source and destination are shown where there is only one of them
  static final Operator Xor = new _Operator(12);

  /// Source and destination layers are accumulated
  static final Operator Add = new _Operator(13);

  /// Like over, but assuming source and dest are disjoint geometries
  static final Operator Saturate = new _Operator(14);

  /// Source and destination layers are multiplied. This causes the result to be at least as dark as the darker inputs
  static final Operator Multiply = new _Operator(15);

  ///
  /// Source and destination are complemented and multiplied. This causes the result to be at least
  /// as light as the lighter inputs.
  ///
  static final Operator Screen = new _Operator(16);

  /// Multiplies or screens, depending on the lightness of the destination color
  static final Operator Overlay = new _Operator(17);

  /// Replaces the destination with the source if it is darker, otherwise keeps the source
  static final Operator Darken = new _Operator(18);

  /// Replaces the destination with the source if it is lighter, otherwise keeps the source.
  static final Operator Lighten = new _Operator(19);

  /// Brightens the destination color to reflect the source color
  static final Operator ColorDodge = new _Operator(20);

  /// Darkens the destination color to reflect the source color
  static final Operator ColorBurn = new _Operator(21);

  /// Multiplies or screens, dependent on source color
  static final Operator HardLight = new _Operator(22);

  /// Darkens or lightens, dependent on source color
  static final Operator SoftLight = new _Operator(23);

  /// Takes the difference of the source and destination color
  static final Operator Difference = new _Operator(24);

  /// Produces an effect similar to difference, but with lower contrast
  static final Operator Exclusion = new _Operator(25);

  /// Creates a color with the hue of the source and the saturation and luminosity of the target
  static final Operator HSLHUE = new _Operator(26);

  ///
  /// Creates a color with the saturation of the source and the hue and luminosity of the target.
  ///
  /// Painting with this mode onto a gray area produces no change.
  ///
  static final Operator HSLSaturation = new _Operator(27);

  ///
  /// Creates a color with the hue and saturation of the source and the luminosity of the target.
  /// This preserves the gray levels of the target and is useful for
  /// coloring monochrome images or tinting color images.
  ///
  static final Operator HSLColor = new _Operator(28);

  ///
  /// Creates a color with the luminosity of the source and the hue and saturation of the target.
  ///
  /// This produces an inverse effect to [Operator.HSLColor].
  ///
  static final Operator HSLLuminosity = new _Operator(29);
  
  
  int get value;
}

class _Operator implements Operator {
  int _val;
  
  _Operator(this._val);
  
  int get value => _val;
  
  @override
  operator==(Operator other) => other.value == value;
}
