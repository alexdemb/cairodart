part of cairodart.base;

class CairoException implements Exception {
  String cause;
  int status;

  CairoException(this.cause, this.status);
  
  @override
  String toString() => 'Cause: $cause, Status: $status';
}

class CairoStatus {
  static final int SUCCESS = 0;
  static final int NO_MEMORY = 1;
  static final int INVALID_RESTORE = 2;
  static final int INVALID_POP_GROUP = 3;
  static final int NO_CURRENT_POINT = 4;
  static final int INVALID_MATRIX = 5;
  static final int INVALID_STATUS = 6;
  static final int NULL_POINTER = 7;
  static final int INVALID_STRING = 8;
  static final int INVALID_PATH_DATA = 9;
  static final int READ_ERROR = 10;
  static final int WRITE_ERROR = 11;
  static final int SURFACE_FINISHED = 12;
  static final int SURFACE_TYPE_MISMATCH = 13;
  static final int PATTERN_TYPE_MISMATCH = 14;
  static final int INVALID_CONTENT = 15;
  static final int INVALID_FORMAT = 16;
  static final int INVALID_VISUAL = 17;
  static final int FILE_NOT_FOUND = 18;
  static final int INVALID_DASH = 19;
  static final int INVALID_DSC_COMMENT = 20;
  static final int INVALID_INDEX = 21;
  static final int CLIP_NOT_REPRESENTABLE = 22;
  static final int TEMP_FILE_ERROR = 23;
  static final int INVALID_STRIDE = 24;
  static final int FONT_TYPE_MISMATCH = 25;
  static final int USER_FONT_IMMUTABLE = 26;
  static final int USER_FONT_ERROR = 27;
  static final int NEGATIVE_COUNT = 28;
  static final int INVALID_CLUSTERS = 29;
  static final int INVALID_SLANT = 30;
  static final int INVALID_WEIGHT = 31;
  static final int INVALID_SIZE = 32;
  static final int USER_FONT_NOT_IMPLEMENTED = 33;
  static final int DEVICE_TYPE_MISMATCH = 34;
  static final int DEVICE_ERROR = 35;
  static final int INVALID_MESH_CONSTRUCTION = 36;
  static final int DEVICE_FINISHED = 37;
  static final int LAST_STATUS = 38;
}
