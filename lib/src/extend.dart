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
/// Used to describe how pattern color/alpha will be determined for areas "outside" the pattern's natural area,
/// (for example, outside the surface bounds or outside the gradient geometry).
///
/// Mesh patterns are not affected by the extend mode.
///
/// The default extend mode is [Extend.None] for surface patterns and [Extend.Pad] for gradient patterns.
/// New entries may be added in future versions.
///
abstract class Extend {

  /// Pixels outside of the source pattern are fully transparent
  static Extend None = new _Extend(0);

  /// The pattern is tiled by repeating
  static Extend Repeat = new _Extend(1);

  /// The pattern is tiled by reflecting at the edges
  static Extend Reflect = new _Extend(2);

  /// Pixels outside of the pattern copy the closest pixel from the source
  static Extend Pad = new _Extend(3);
  
  int get value;
}

class _Extend implements Extend {
  int _val;
  
  _Extend(this._val);
  
  int get value => _val;
  
  @override 
  operator==(Extend other) => value == other.value;
}