part of cairodart.base;

abstract class Resolution {
  
  factory Resolution(double xRes, double yRes) => new _Resolution(xRes, yRes);
  
  double get xResolution;
  double get yResolution;
  
}

class _Resolution implements Resolution {
  
  double _xResolution;
  double _yResolution;
  
  _Resolution(this._xResolution, this._yResolution);
  
  double get xResolution => _xResolution;
  double get yResolution => _yResolution;
}
