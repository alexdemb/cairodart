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
/// Used to describe the type of a given pattern.
///
/// The type of a pattern is determined by the function used to create it.
/// The pattern type can be queried with [Pattern.type].
///
/// Most pattern methods can be called with a pattern of any type,
/// (though trying to change the extend or filter for a solid pattern will have no effect).
/// A notable exception is [addColorStop()] which must only be called with gradient patterns (either Linear or Radial).
/// Otherwise the pattern will be shutdown and put into an error state.
///
/// New entries may be added in future versions.
///
abstract class PatternType {

  /// The pattern is a solid (uniform) color. It may be opaque or translucent
  static final PatternType Solid = new _PatternType(0);

  /// The pattern is a based on a surface
  static final PatternType Surface = new _PatternType(1);

  /// The pattern is a linear gradient
  static final PatternType Linear = new _PatternType(2);

  /// The pattern is a radial gradient
  static final PatternType Radial = new _PatternType(3);

  /// The pattern is a mesh
  static final PatternType Mesh = new _PatternType(4);

  /// The pattern is a user pattern providing raster data
  static final PatternType RasterSource = new _PatternType(5);
  
  int get value;
}

class _PatternType implements PatternType {
  int _val;
  
  _PatternType(this._val);
  
  int get value => _val;
  
  @override
  operator==(PatternType other) => value == other.value;
}