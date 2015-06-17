part of cairodart.base;

abstract class Glyphs {
  List<Glyph> get glyphs;
  List<TextCluster> get clusters;
  TextClusterFlags get flags;
}

class _Glyphs implements Glyphs {
  List<Glyph> glyphs;
  List<TextCluster> clusters;
  TextClusterFlags flags;

  _Glyphs(this.glyphs, this.clusters, this.flags);
}