part of cairodart.base;

abstract class PdfVersion {
  static final PdfVersion OnePointFour = new _PdfVersion(0);
  static final PdfVersion OnePointFive = new _PdfVersion(1);

  int get value;
}

class _PdfVersion implements PdfVersion {

  int _val;
  int get value => _val;

  _PdfVersion(this._val);

  @override
  operator==(PdfVersion other) => other.value == value;

  @override
  String toString() => _versionToString(this.value);

  String _versionToString(int value) native 'pdf_version_to_string';
}