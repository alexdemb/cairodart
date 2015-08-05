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

part of cairodart.test;

runDeviceTests() {
  group('Device', () {
    test('should have success status when created', () {
      var device = new Device.script( './test.tmp');

      expect(device.status, equals(CairoStatus.Success));
    });
    test('should return correct device type for script', () {
      var device = new Device.script( './test.tmp');

      DeviceType devType = device.type;
      expect(devType, equals(DeviceType.Script));
    });
  });
}