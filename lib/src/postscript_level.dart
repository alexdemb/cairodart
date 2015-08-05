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
/// Used to describe the language level of the PostScript Language Reference
/// that a generated PostScript file will conform to.
///
abstract class PostScriptLevel {

  /// The language level 2 of the PostScript specification
  static final PostScriptLevel LevelTwo = new _PostScriptLevel(0);

  /// The language level 3 of the PostScript specification
  static final PostScriptLevel LevelThree = new _PostScriptLevel(1);

  int get value;

}

class _PostScriptLevel implements PostScriptLevel {

  int _val;
  int get value => _val;

  _PostScriptLevel(this._val);

  @override
  operator==(PostScriptLevel other) => other.value == value;

  @override
  String toString() => _levelToString(value);

  String _levelToString(int val) native 'ps_level_to_string';
}