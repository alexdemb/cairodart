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

abstract class RectangleList {
  CairoStatus get status;
  List<Rectangle> get rectangles;
  void destroy();
}

class _RectangleList extends NativeFieldWrapperClass2 implements RectangleList {
  CairoStatus _status;
  CairoStatus get status => _status;
  _Context _context;
    
  List<Rectangle> _rectangles;
  List<Rectangle> get rectangles => []..addAll(_rectangles);
    
  _RectangleList(this._context, this._status, this._rectangles);
  
  void destroy() => _context._destroyRectangleList(this);
}