part of cairodart.base;

abstract class Region {
  
  factory Region() => new _Region();
  factory Region.rectangle(int x, int y, int width, int height) => new _Region.rectangle(x, y, width, height);
  
}

class _Region extends NativeFieldWrapperClass2 implements Region {
  
  _Region() {
    _create();
  }
  
  _Region.rectangle(int x, int y, int width, int height) {
     _createRectangle(x, y, width, height);
   }
  
  void _create() native 'region_create';
  
  void _createRectangle(int x, int y, int width, int height) native 'region_create_rectangle';
  
}