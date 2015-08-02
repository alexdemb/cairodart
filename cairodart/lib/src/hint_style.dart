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
/// Specifies the type of hinting to do on font outlines. Hinting is the process of fitting outlines to the
/// pixel grid in order to improve the appearance of the result.
///
/// Since hinting outlines involves distorting them, it also reduces the faithfulness to the original outline shapes.
/// Not all of the outline hinting styles are supported by all font backends.
///
/// New entries may be added in future versions.
///
///
abstract class HintStyle {

  /// Use the default hint style for font backend and target device
  static final HintStyle Default = new _HintStyle(0);

  /// Do not hint outlines
  static final HintStyle None = new _HintStyle(1);

  /// Hint outlines slightly to improve contrast while retaining good fidelity to the original shapes
  static final HintStyle Slight = new _HintStyle(2);

  /// Hint outlines with medium strength giving a compromise between fidelity to the original shapes and contrast
  static final HintStyle Medium = new _HintStyle(3);

  /// Hint outlines to maximize contrast
  static final HintStyle Full = new _HintStyle(4);
  
  int get value;
}

class _HintStyle implements HintStyle {
  
  int _val;
  
  _HintStyle(this._val);
  
  int get value => _val;
  
  @override
  operator==(HintStyle other) => other.value == value;
  
}