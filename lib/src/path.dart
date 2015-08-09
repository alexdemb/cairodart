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
/// A data structure for holding a path.
///
/// This data structure serves as the return value for [Context.copyPath()] and [Context.copyPathFlat()] as well the
/// input value for [Context.appendPath()].
///
abstract class Path {

  factory Path._internal() => new _Path.internal();

  Iterator<PathElement> iterator();

}

class _Path extends NativeFieldWrapperClass2 implements Path {

  _Path.internal() { }

  Iterator<PathElement> iterator() => new _PathIterator(this);

}


class _PathIterator extends NativeFieldWrapperClass2 implements Iterator<PathElement> {

  _PathIterator(path) {
    _createPathIterator(path);
  }

  void _createPathIterator(Path path) native 'create_path_iterator';

  @override
  bool moveNext() native 'path_iterator_move_next';

  @override
  PathElement get current native 'path_iterator_current';

}