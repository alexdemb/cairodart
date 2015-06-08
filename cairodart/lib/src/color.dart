part of cairodart.base;

abstract class Color {
  
  factory Color.rgb(double red, double green, double blue) => new _Color.rgb(red, green, blue);
  
  factory Color.rgba(double red, double green, double blue, double alpha) => new _Color.rgba(red, green, blue, alpha);
  
  double get red;
  
  double get green;
  
  double get blue;
  
  double get alpha;
    
  
}


class _Color implements Color {
  double red = 0.0;
  double green = 0.0;
  double blue = 0.0;
  double alpha = 0.0;
    
  _Color.rgb(this.red, this.green, this.blue);  
  _Color.rgba(this.red, this.green, this.blue, this.alpha);
    
  
}