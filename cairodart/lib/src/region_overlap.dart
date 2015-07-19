part of cairodart.base;

abstract class RegionOverlap {
  static final RegionOverlap OverlapIn = new _RegionOverlap(0);
  static final RegionOverlap OverlapOut = new _RegionOverlap(1);
  static final RegionOverlap OverlapPart = new _RegionOverlap(2);
  
  int get value;
}

class _RegionOverlap implements RegionOverlap {
  
  int _val;
  
  int get value => _val;
  
  _RegionOverlap(this._val);
  
  @override
  operator==(RegionOverlap other) => other.value == value;
}