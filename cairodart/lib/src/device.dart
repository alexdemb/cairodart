part of cairodart.base;

abstract class Device {

  factory Device.script(String fileName) => new _Device.script(fileName);

  void finish();
  void flush();
  void acquire();
  void release();
  DeviceType get type;

}

class _Device extends NativeFieldWrapperClass2 implements Device {

  _Device() {}

  _Device.script(String fileName) {
    _createScript(fileName);
  }

  void _createScript(String fileName) native 'script_create';

  void finish() native 'device_finish';
  void flush() native 'device_flush';
  void acquire() native 'device_acquire';
  void release() native 'device_release';
  DeviceType get type native 'device_get_type';

}