part of cairodart.base;

abstract class RegionOverlap {
  static final RegionOverlap OVERLAP_IN = new _RegionOverlap(0);
  static final RegionOverlap OVERLAP_OUT = new _RegionOverlap(1);
  static final RegionOverlap OVERLAP_PART = new _RegionOverlap(2);
  
  int get value;
}

class _RegionOverlap implements RegionOverlap {
  
  int _val;
  
  int get value => _val;
  
  _RegionOverlap(this._val);
  
  @override
  operator==(RegionOverlap other) => other.value == value;
}