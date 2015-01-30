part of cairodart.test;

runSurfaceTests() {
  group('Image Surface', () {
    test('should have correct value of width', () {
      var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      expect(surface.width, equals(640));
    });
    test('should have correct value of height', () {
      var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      expect(surface.height, equals(480));
    });
  });
}