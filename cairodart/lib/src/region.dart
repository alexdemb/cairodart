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

abstract class Region implements RefObject {
  
  factory Region() => new _Region();
  factory Region.fromArea(int x, int y, int width, int height) => new _Region.fromArea(x, y, width, height);
  factory Region.fromRectangle(Rectangle rect) => new _Region.fromRectangle(rect);
  factory Region.fromRectangles(List<Rectangle> rectangles) => new _Region.fromRectangles(rectangles);
  factory Region._internal() => new _Region._internal();
  
  Region copy();
  Rectangle getExtents();
  int get countOfRectangles;
  Rectangle rectangleAt(int nth);
  bool get isEmpty;
  bool containsPoint(Point point);
  bool containsPointWithCoords(int x, int y);
  RegionOverlap containsRectangle(Rectangle rect);
  RegionOverlap containsRectangleWithCoords(int x, int y, int width, int height);
  void translate(int dx, int dy);
  void translateToDistance(Distance dist);
  void intersect(Region other);
  void subtract(Region other);
  void union(Region other);
  void xor(Region other);
  void intersectRectangle(Rectangle rect);
  void intersectRectangleWithCoords(int x, int y, int width, int height);
  void subtractRectangle(Rectangle rect);
  void subtractRectangleWithCoords(int x, int y, int width, int height);
  void unionRectangle(Rectangle rect);
  void unionRectangleWithCoords(int x, int y, int width, int height);
  void xorRectangle(Rectangle rect);
  void xorRectangleWithCoords(int x, int y, int width, int height);
}

class _Region extends NativeFieldWrapperClass2 implements Region {
  
  _Region() {
    _create();
  }
  
  _Region.fromArea(int x, int y, int width, int height) {
     _createRectangle(x, y, width, height);
   }
  
  _Region.fromRectangle(Rectangle rect) {
    _createRectangle(rect.x, rect.y, rect.width, rect.height);
  }
  
  _Region.fromRectangles(List<Rectangle> rectangles) {
    List<int> areas = [];
    
    rectangles.where((_) => _ != null).forEach((rect) => 
        areas.addAll([rect.x, rect.y, rect.width, rect.height]));
    
    _createRectangles(areas);    
  }
  
  _Region._internal() {}
  
  void _create() native 'region_create';
  
  void _createRectangle(int x, int y, int width, int height) native 'region_create_rectangle';
  
  void _createRectangles(List<int> areas) native 'region_create_rectangles';
  
  Region copy() native 'region_copy';
  
  Rectangle getExtents() native 'region_get_extents';
  
  int get countOfRectangles native 'region_get_num_rectangles';
  
  Rectangle rectangleAt(int nth) native 'region_get_rectangle';
  
  bool get isEmpty native 'region_is_empty';
  
  bool containsPoint(Point point) => containsPointWithCoords(point.x.toInt(), point.y.toInt());
  
  bool containsPointWithCoords(int x, int y) native 'region_contains_point';
  
  RegionOverlap containsRectangle(Rectangle rect) => containsRectangleWithCoords(rect.x, rect.y, rect.width, rect.height);
  
  RegionOverlap containsRectangleWithCoords(int x, int y, int width, int height) native 'region_contains_rectangle';
  
  void translate(int dx, int dy) native 'region_translate';
  
  void translateToDistance(Distance dist) => translate(dist.dx.toInt(), dist.dy.toInt());
  
  void intersect(Region other) native 'region_intersect';
  
  void subtract(Region other) native 'region_subtract';
  
  void union(Region other) native 'region_union';
  
  void xor(Region other) native 'region_xor';
  
  void intersectRectangle(Rectangle rect) => intersectRectangleWithCoords(rect.x, rect.y, rect.width, rect.height);
  
  void intersectRectangleWithCoords(int x, int y, int width, int height) native 'region_intersect_rectangle';
  
  void subtractRectangle(Rectangle rect) => subtractRectangleWithCoords(rect.x.toInt(),  rect.y.toInt(), rect.width.toInt(), rect.height.toInt());
  
  void subtractRectangleWithCoords(int x, int y, int width, int height) native 'region_subtract_rectangle';
  
  void unionRectangle(Rectangle rect) => unionRectangleWithCoords(rect.x.toInt(),  rect.y.toInt(), rect.width.toInt(), rect.height.toInt());
  
  void unionRectangleWithCoords(int x, int y, int width, int height) native 'region_union_rectangle';
  
  void xorRectangle(Rectangle rect) => xorRectangleWithCoords(rect.x.toInt(),  rect.y.toInt(), rect.width.toInt(), rect.height.toInt());
  
  void xorRectangleWithCoords(int x, int y, int width, int height) native 'region_xor_rectangle';

  CairoStatus get status native 'region_status';
  
  @override
  operator==(Region other) native 'region_equal';
  
}