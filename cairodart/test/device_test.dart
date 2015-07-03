part of cairodart.test;

runDeviceTests() {
  group('Device', () {
    test('should return corret device type for script', () {
      var device = new Device.script( './test.tmp');

      DeviceType devType = device.type;
      expect(devType, equals(DeviceType.Script));
    });
  });
}