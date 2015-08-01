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
/// Specifies the type of antialiasing to do when rendering text or shapes.
///
/// These make no guarantee on how the backend will perform its rasterisation (if it even rasterises!),
/// nor that they have any differing effect other than to enable some form of antialiasing. In the case of glyph rendering,
/// [Fast] and [Good] will be mapped to [Gray],
/// with [Best] being equivalent to [Subpixel].
///
/// The interpretation of [Default] is left entirely up to the backend,
/// typically this will be similar to [Good].
///
abstract class Antialias {

  /// Use the default antialiasing for the subsystem and target device.
  static final Antialias Default = new _Antialias(0);

  /// Use a bilevel alpha mask.
  static final Antialias None = new _Antialias(1);

  /// Perform single-color antialiasing (using shades of gray for black text on a white background, for example).
  static final Antialias Gray = new _Antialias(2);

  /// Perform antialiasing by taking advantage of the order of subpixel elements on devices such as LCD panels.
  static final Antialias Subpixel = new _Antialias(3);

  /// Hint that the backend should perform some antialiasing but prefer speed over quality.
  static final Antialias Fast = new _Antialias(4);

  /// The backend should balance quality against performance.
  static final Antialias Good = new _Antialias(5);

  /// Hint that the backend should render at the highest quality, sacrificing speed if necessary.
  static final Antialias Best = new _Antialias(6);
    
  int get value;
}

class _Antialias implements Antialias {
  int _val;
  
  _Antialias(this._val);
  
  int get value => _val;
  
  @override
  operator==(Antialias other) => value == other.value;  
}

