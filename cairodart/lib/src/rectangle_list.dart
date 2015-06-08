part of cairodart.base;

abstract class RectangleList {
  int get status;
  List<Rectangle> get rectangles;
  void destroy();
}

class _RectangleList extends NativeFieldWrapperClass2 implements RectangleList {
  int _status;
  int get status => _status;
  _Context _context;
    
  List<Rectangle> _rectangles;
  List<Rectangle> get rectangles => []..addAll(_rectangles);
    
  _RectangleList(this._context, this._status, this._rectangles);
  
  void destroy() => _context._destroyRectangleList(this);
}