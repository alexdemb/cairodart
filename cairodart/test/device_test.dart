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