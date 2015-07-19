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