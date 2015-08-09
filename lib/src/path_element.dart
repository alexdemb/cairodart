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
/// Represents the part of a path.
///
abstract class PathElement {

  /// Gets the type of the given path element.
  PathElementType get type;

  /// Gets the point in the given path element.
  Point get point;

}

class _PathElement extends NativeFieldWrapperClass2 implements PathElement {

  PathElementType get type native 'path_element_get_type';

  _PathElement.internal() {}

  Point get point native 'path_element_get_point';

}