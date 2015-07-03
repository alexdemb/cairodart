part of cairodart.base;

abstract class DeviceType {
  static final DeviceType Drm = new _DeviceType(0);
  static final DeviceType Gl = new _DeviceType(1);
  static final DeviceType Script = new _DeviceType(2);
  static final DeviceType Xcb = new _DeviceType(3);
  static final DeviceType Xlib = new _DeviceType(4);
  static final DeviceType Xml = new _DeviceType(5);
  static final DeviceType Cogl = new _DeviceType(6);
  static final DeviceType Win32 = new _DeviceType(7);
  static final DeviceType Invalid = new _DeviceType(8);

  int get value;


}

class _DeviceType implements DeviceType {

  int _val;
  int get value => _val;

  _DeviceType(this._val);

  @override
  operator==(DeviceType other) => other.value == value;
}