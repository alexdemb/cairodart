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

abstract class Color {
  
  factory Color.rgb(num red, num green, num blue) => new _Color.rgb(red.toDouble(), green.toDouble(), blue.toDouble());
  
  factory Color.rgba(num red, num green, num blue, num alpha) => new _Color.rgba(red.toDouble(), green.toDouble(), blue.toDouble(), alpha.toDouble());
  
  double get red;
  
  double get green;
  
  double get blue;
  
  double get alpha;
}


class _Color implements Color {
  double red = 0.0;
  double green = 0.0;
  double blue = 0.0;
  double alpha = 1.0;
    
  _Color.rgb(this.red, this.green, this.blue);  
  _Color.rgba(this.red, this.green, this.blue, this.alpha);


  @override
  operator==(Color other) => other.red == red && other.green == green && other.blue == blue && other.alpha == alpha;

  @override
  String toString() => 'Color($red,$green,$blue,$alpha)';
}