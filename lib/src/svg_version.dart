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
/// Used to describe the version number of the SVG specification that a generated SVG file will conform to.
///
abstract class SvgVersion {

  /// The version 1.1 of the SVG specification
  static final SvgVersion OnePointOne = new _SvgVersion(0);

  /// The version 1.2 of the SVG specification
  static final SvgVersion OnePointTwo = new _SvgVersion(1);

  int get value;
}

class _SvgVersion implements SvgVersion {
  int get value => _val;
  int _val;

  _SvgVersion(this._val);

  @override
  operator==(SvgVersion other) => other.value == value;

  @override
  String toString() => _versionToString(value);

  String _versionToString(int value) native 'svg_version_to_string';
}