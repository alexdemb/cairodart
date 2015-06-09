part of cairodart.base;

abstract class FontExtents {
  double ascent;
  double descent;
  double height;
  double maxXAdvance;
  double maxYAdvance;
}

class _FontExtents implements FontExtents {
  double ascent;
  double descent;
  double height;
  double maxXAdvance;
  double maxYAdvance;
  
  _FontExtents(this.ascent, this.descent, this.height, this.maxXAdvance, this.maxYAdvance);
  
  @override
  operator==(FontExtents other) =>
      other.ascent == ascent &&
      other.descent == descent &&
      other.height == height &&
      other.maxXAdvance == maxXAdvance &&
      other.maxYAdvance == maxYAdvance;
    
}
