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
/// The [TextCluster] structure holds information about a single text cluster.
///
/// A text cluster is a minimal mapping of some glyphs corresponding to some UTF-8 text.
/// For a cluster to be valid, both numBytes and numGlyphs should be non-negative,
/// and at least one should be non-zero.
///
/// Note that clusters with zero glyphs are not as well supported as normal clusters.
/// For example, PDF rendering applications typically ignore those clusters when PDF text is being selected.
///
abstract class TextCluster {

  /// The number of bytes of UTF-8 text covered by cluster
  int get numBytes;

  /// The number of glyphs covered by cluster
  int get numGlyphs;

  ///
  /// Creates a [TextCluster] object using specified number of bytes and number of glyphs.
  ///
  factory TextCluster(int numBytes, int numGlyphs) => new _TextCluster(numBytes, numGlyphs);

}

class _TextCluster implements TextCluster {

  int _numBytes;
  int _numGlyphs;
  int get numBytes => _numBytes;
  int get numGlyphs => _numGlyphs;

  _TextCluster(this._numBytes, this._numGlyphs);

  @override
  operator==(TextCluster other) => other.numBytes == numBytes && other.numGlyphs == numGlyphs;

}
