part of cairodart.base;

abstract class TextClusterFlags {
  static final TextClusterFlags Backward = new _TextClusterFlags(0x00000001);

  int get value;
}

class _TextClusterFlags implements TextClusterFlags {

  int _val;

  _TextClusterFlags(this._val);


  int get value => _val;

  @override
  operator==(TextClusterFlags other) => other.value == value;
}

