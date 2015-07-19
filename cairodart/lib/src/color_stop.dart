part of cairodart.base;

abstract class ColorStop {
  
  Color get color;
  double get offset;
  
  factory ColorStop(Color color, num offset) => new _ColorStop(color, offset.toDouble());
  
}

class _ColorStop implements ColorStop {
  
  Color _color;
  double _offset;
    
  
  Color get color => _color;
  double get offset => _offset;
    
  
  _ColorStop(this._color, this._offset);
  
}