part of cairodart.base;

abstract class Dash {
  double get offset;
  List<double> get dashes;
 
  factory Dash(List<double> dashes, double offset) => new _Dash(dashes, offset);
}

class _Dash implements Dash {
  
  double _offset;
  List<double> _dashes;
  
  _Dash(this._dashes, this._offset);
  
  double get offset => _offset;
  
  List<double> get dashes => _dashes;
  
  @override
  operator==(Dash other) => offset == other.offset && _dashesEqual(dashes, other.dashes); 
  
  bool _dashesEqual(List<double> first, List<double> second) {
    var i = -1;
    return first.every((element) {
      i++;
      return second[i] == element;
    });
  }
  
  @override
  String toString() => 'offset: $offset, dashes: $dashes';
}