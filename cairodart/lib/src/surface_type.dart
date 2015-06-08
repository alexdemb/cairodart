part of cairodart.base;

abstract class SurfaceType {
  static final SurfaceType IMAGE = new _SurfaceType(0);
  static final SurfaceType PDF = new _SurfaceType(1);
  static final SurfaceType PS = new _SurfaceType(2);
  static final SurfaceType XLIB = new _SurfaceType(3);
  static final SurfaceType XCB = new _SurfaceType(4);
  static final SurfaceType GLITZ = new _SurfaceType(5);
  static final SurfaceType QUARTZ = new _SurfaceType(6);
  static final SurfaceType WIN32 = new _SurfaceType(7);
  static final SurfaceType BEOS = new _SurfaceType(8);
  static final SurfaceType DIRECTFB = new _SurfaceType(9);
  static final SurfaceType SVG = new _SurfaceType(10);
  static final SurfaceType OS2 = new _SurfaceType(11);
  static final SurfaceType PRINTING = new _SurfaceType(12);
  static final SurfaceType QUARTZ_IMAGE = new _SurfaceType(13);
  static final SurfaceType SCRIPT = new _SurfaceType(14);
  static final SurfaceType QT = new _SurfaceType(15);
  static final SurfaceType RECORDING = new _SurfaceType(16);
  static final SurfaceType VG = new _SurfaceType(17);
  static final SurfaceType GL = new _SurfaceType(18);
  static final SurfaceType DRM = new _SurfaceType(19);
  static final SurfaceType TEE = new _SurfaceType(20);
  static final SurfaceType XML = new _SurfaceType(21);
  static final SurfaceType SKIA = new _SurfaceType(22);
  static final SurfaceType SUBSURFACE = new _SurfaceType(23);
  static final SurfaceType COG = new _SurfaceType(24);
 
  int get value;
}

class _SurfaceType extends NativeFieldWrapperClass2 implements SurfaceType {
  
  int _val;
  
  _SurfaceType(this._val);
  
  int get value => _val;
  
  @override
  operator==(SurfaceType other) => value == other.value;
}