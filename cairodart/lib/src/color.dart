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