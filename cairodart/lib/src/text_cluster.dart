part of cairodart.base;

abstract class TextCluster {

  int get numBytes;
  int get numGlyphs;

  factory TextCluster(int numBytes, int numGlyphs) => new _TextCluster(numBytes, numGlyphs);

}

class _TextCluster implements TextCluster {

  int _numBytes;
  int _numGlyphs;
  int get numBytes => _numBytes;
  int get numGlyphs => _numGlyphs;

  _TextCluster(this._numBytes, this._numGlyphs);

  @override
  operator==(TextCluster other) => other.numBytes == numBytes && other.numGlyphs == numGlyphs;

}
