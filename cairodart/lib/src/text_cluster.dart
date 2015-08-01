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

abstract class TextCluster {

  int get numBytes;
  int get numGlyphs;

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
