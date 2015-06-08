part of cairodart.base;

abstract class HintMetrics {
  static final HintMetrics Default = new _HintMetrics(0);
  static final HintMetrics Off = new _HintMetrics(1);
  static final HintMetrics On = new _HintMetrics(2);
  
  int get value;
}

class _HintMetrics implements HintMetrics {
  int _val;
  
  _HintMetrics(this._val);
  
  int get value => _val;
  
  @override
  operator==(HintMetrics other) => other.value == value;
  
}