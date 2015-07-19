part of cairodart.base;

class CairoException implements Exception {
  String cause;
  int status;

  CairoException(this.cause, this.status);
  
  @override
  String toString() => 'Cause: $cause, Status: $status';
}

class CairoStatus {
  static final int Success = 0;
  static final int NoMemory = 1;
  static final int InvalidRestore = 2;
  static final int InvalidPopGroup = 3;
  static final int NoCurrentPoint = 4;
  static final int InvalidMatrix = 5;
  static final int InvalidStatus = 6;
  static final int NullPointer = 7;
  static final int InvalidString = 8;
  static final int InvalidPathData = 9;
  static final int ReadError = 10;
  static final int WriteError = 11;
  static final int SurfaceFinished = 12;
  static final int SurfaceTypeMismatch = 13;
  static final int PatternTypeMismatch = 14;
  static final int InvalidContent = 15;
  static final int InvalidFormat = 16;
  static final int InvalidVisual = 17;
  static final int FileNotFound = 18;
  static final int InvalidDash = 19;
  static final int InvalidDscComment = 20;
  static final int InvalidIndex = 21;
  static final int ClipNotRepresentable = 22;
  static final int TempFileError = 23;
  static final int InvalidStride = 24;
  static final int FontTypeMismatch = 25;
  static final int UserFontImmutable = 26;
  static final int UserFontError = 27;
  static final int NegativeCount = 28;
  static final int InvalidClusters = 29;
  static final int InvalidSlant = 30;
  static final int InvalidWeight = 31;
  static final int InvalidSize = 32;
  static final int UserFontNotImplemented = 33;
  static final int DeviceTypeMismatch = 34;
  static final int DeviceError = 35;
  static final int InvalidMeshConstruction = 36;
  static final int DeviceFinished = 37;
  static final int LastStatus = 38;
}
