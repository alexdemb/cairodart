part of cairodart.base;

abstract class TextExtents {
  double xBearing;
  double yBearing;
  double width;
  double height;
  double xAdvance;
  double yAdvance;  
}

class _TextExtents implements TextExtents {
  double xBearing;
  double yBearing;
  double width;
  double height;
  double xAdvance;
  double yAdvance;    
  
  _TextExtents(this.xBearing, this.yBearing, this.width, this.height, this.xAdvance, this.yAdvance);
  
  @override
  operator==(TextExtents other) =>
      other.xBearing == xBearing &&
      other.yBearing == yBearing &&
      other.width == width &&
      other.height == height &&
      other.xAdvance == xAdvance &&
      other.yAdvance == yAdvance;
}
