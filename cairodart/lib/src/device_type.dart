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