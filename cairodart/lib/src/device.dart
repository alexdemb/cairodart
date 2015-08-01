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

abstract class Device implements RefObject {

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
  CairoStatus get status native 'device_status';

}