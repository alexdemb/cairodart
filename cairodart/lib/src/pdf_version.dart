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

abstract class PdfVersion {
  static final PdfVersion OnePointFour = new _PdfVersion(0);
  static final PdfVersion OnePointFive = new _PdfVersion(1);

  int get value;
}

class _PdfVersion implements PdfVersion {

  int _val;
  int get value => _val;

  _PdfVersion(this._val);

  @override
  operator==(PdfVersion other) => other.value == value;

  @override
  String toString() => _versionToString(this.value);

  String _versionToString(int value) native 'pdf_version_to_string';
}