part of cairodart.base;

class CairoException implements Exception {
  String cause;
  CairoStatus status;

  CairoException(this.cause, this.status);
  
  @override
  String toString() => 'Cause: $cause, Status: $status';
}

class CairoStatus {
  static final CairoStatus Success = new CairoStatus(0);
  static final CairoStatus NoMemory = new CairoStatus(1);
  static final CairoStatus InvalidRestore = new CairoStatus(2);
  static final CairoStatus InvalidPopGroup = new CairoStatus(3);
  static final CairoStatus NoCurrentPoint = new CairoStatus(4);
  static final CairoStatus InvalidMatrix = new CairoStatus(5);
  static final CairoStatus InvalidStatus = new CairoStatus(6);
  static final CairoStatus NullPointer = new CairoStatus(7);
  static final CairoStatus InvalidString = new CairoStatus(8);
  static final CairoStatus InvalidPathData = new CairoStatus(9);
  static final CairoStatus ReadError = new CairoStatus(10);
  static final CairoStatus WriteError = new CairoStatus(11);
  static final CairoStatus SurfaceFinished = new CairoStatus(12);
  static final CairoStatus SurfaceTypeMismatch = new CairoStatus(13);
  static final CairoStatus PatternTypeMismatch = new CairoStatus(14);
  static final CairoStatus InvalidContent = new CairoStatus(15);
  static final CairoStatus InvalidFormat = new CairoStatus(16);
  static final CairoStatus InvalidVisual = new CairoStatus(17);
  static final CairoStatus FileNotFound = new CairoStatus(18);
  static final CairoStatus InvalidDash = new CairoStatus(19);
  static final CairoStatus InvalidDscComment = new CairoStatus(20);
  static final CairoStatus InvalidIndex = new CairoStatus(21);
  static final CairoStatus ClipNotRepresentable = new CairoStatus(22);
  static final CairoStatus TempFileError = new CairoStatus(23);
  static final CairoStatus InvalidStride = new CairoStatus(24);
  static final CairoStatus FontTypeMismatch = new CairoStatus(25);
  static final CairoStatus UserFontImmutable = new CairoStatus(26);
  static final CairoStatus UserFontError = new CairoStatus(27);
  static final CairoStatus NegativeCount = new CairoStatus(28);
  static final CairoStatus InvalidClusters = new CairoStatus(29);
  static final CairoStatus InvalidSlant = new CairoStatus(30);
  static final CairoStatus InvalidWeight = new CairoStatus(31);
  static final CairoStatus InvalidSize = new CairoStatus(32);
  static final CairoStatus UserFontNotImplemented = new CairoStatus(33);
  static final CairoStatus DeviceTypeMismatch = new CairoStatus(34);
  static final CairoStatus DeviceError = new CairoStatus(35);
  static final CairoStatus InvalidMeshConstruction = new CairoStatus(36);
  static final CairoStatus DeviceFinished = new CairoStatus(37);
  static final CairoStatus LastStatus = new CairoStatus(38);

  int statusCode;

  CairoStatus(this.statusCode);

  @override
  operator==(CairoStatus other) => other.statusCode == this.statusCode;
}
