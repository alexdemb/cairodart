///
/// This library is free software; you can redistribute it and/or
/// modify it under the terms of the GNU Lesser General Public
/// License as published by the Free Software Foundation; either
/// version 2.1 of the License, or (at your option) any later version.
///
/// This library is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
/// Lesser General Public License for more details.
///
/// You should have received a copy of the GNU Lesser General Public
/// License along with this library; if not, write to the Free Software
/// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
/// MA 02110-1301  USA
///

part of cairodart.base;

///
/// Interface to underlying rendering system.
///
abstract class Device implements RefObject {


  factory Device.script(String fileName) => new _Device.script(fileName);


  ///
  /// This function finishes the device and drops all references to external resources.
  ///
  /// All surfaces, fonts and other objects created for this device will be finished, too.
  /// Further operations on the device will not affect the device but will instead
  /// trigger a [CairoStatus.DeviceFinished] error.
  ///
  void finish();

  ///
  /// Finish any pending operations for the device and also restore any temporary modifications cairo
  /// has made to the device's state.
  ///
  /// This function must be called before switching from using the device with Cairo to operating on it directly
  /// with native APIs. If the device doesn't support direct access, then this function does nothing.
  ///
  /// This function may acquire devices.
  ///
  void flush();

  ///
  /// Acquires the device for the current thread.
  ///
  /// This function will block until no other thread has acquired the device.
  ///
  void acquire();

  ///
  /// Releases a device previously acquired using [acquire()] method.
  ///
  void release();

  ///
  /// This function returns the type of the device.
  ///
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
  CairoStatus get status native 'device_status';

}