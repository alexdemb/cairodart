part of cairodart.test;

runContextTests() {
  group('Context', () {
    test('should be successfully created from ImageSurface', () {
      Context ctx = new Context(new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480));
    });
  });
}