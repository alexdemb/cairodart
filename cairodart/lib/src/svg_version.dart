part of cairodart.base;

abstract class SvgVersion {
  static final SvgVersion OnePointOne = new _SvgVersion(0);
  static final SvgVersion OnePointTwo = new _SvgVersion(1);

  int get value;
}

class _SvgVersion implements SvgVersion {
  int get value => _val;
  int _val;

  _SvgVersion(this._val);

  @override
  operator==(SvgVersion other) => other.value == value;

  @override
  String toString() => _versionToString(value);

  String _versionToString(int value) native 'svg_version_to_string';
}