part of cairodart.base;

abstract class Resolution {
  
  factory Resolution(num xRes, num yRes) => new _Resolution(xRes, yRes);
  
  num get xResolution;
  num get yResolution;
  
}

class _Resolution implements Resolution {

  num _xResolution;
  num _yResolution;
  
  _Resolution(this._xResolution, this._yResolution);

  num get xResolution => _xResolution;
  num get yResolution => _yResolution;
}
