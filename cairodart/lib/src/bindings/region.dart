part of cairodart.base;

abstract class Region {
  
  factory Region() => new _Region();
  factory Region.fromArea(int x, int y, int width, int height) => new _Region.fromArea(x, y, width, height);
  factory Region.fromRectangle(Rectangle rect) => new _Region.fromRectangle(rect);
  factory Region.fromRectangles(List<Rectangle> rectangles) => new _Region.fromRectangles(rectangles);
  factory Region._internal() => new _Region._internal();
  
  Region copy();
  Rectangle getExtents();
  int get countOfRectangles;
  Rectangle rectangleAt(int nth);
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
}