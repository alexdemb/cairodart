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
/// Specifies whether to hint font metrics; hinting font metrics means quantizing them so that they are integer
/// values in device space.
///
/// Doing this improves the consistency of letter and line spacing, however it also means that text will be
/// laid out differently at different zoom factors.
///
abstract class HintMetrics {

  /// Hint metrics in the default manner for the font backend and target device
  static final HintMetrics Default = new _HintMetrics(0);

  /// Do not hint font metrics
  static final HintMetrics Off = new _HintMetrics(1);

  /// Hint font metrics
  static final HintMetrics On = new _HintMetrics(2);
  
  int get value;
}

class _HintMetrics implements HintMetrics {
  int _val;
  
  _HintMetrics(this._val);
  
  int get value => _val;
  
  @override
  operator==(HintMetrics other) => other.value == value;
  
}