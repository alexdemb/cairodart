///
/// This library is free software; you can redistribute it and/or
/// modify it under the terms of the GNU Lesser General Public
/// License as published by the Free Software Foundation; either
/// version 2.1 of the License, or (at your option) any later version.
///
/// This library is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
/// Lesser General Public License for more details.
///
/// You should have received a copy of the GNU Lesser General Public
/// License along with this library; if not, write to the Free Software
/// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
/// MA 02110-1301  USA
///

part of cairodart.base;

///
/// Represents a dash rule for drawing context.
///
abstract class Dash {

  /// Dash offset
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