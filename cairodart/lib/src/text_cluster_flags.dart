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
/// Specifies properties of a text cluster mapping.
///
abstract class TextClusterFlags {

  /// The clusters in the cluster array map to glyphs in the glyph array from end to start
  static final TextClusterFlags Backward = new _TextClusterFlags(0x00000001);

  int get value;
}

class _TextClusterFlags implements TextClusterFlags {

  int _val;

  _TextClusterFlags(this._val);


  int get value => _val;

  @override
  operator==(TextClusterFlags other) => other.value == value;
}

