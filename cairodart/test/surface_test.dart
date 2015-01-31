part of cairodart.test;

runSurfaceTests() {
  group('Surface', () {
    test('should have correct value of content', () {
      var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      Content content = surface.content;
      expect(content, equals(Content.CAIRO_CONTENT_COLOR_ALPHA));
    });
  });
  group('Image Surface', () {
    test('should have correct value of width', () {
      var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      expect(surface.width, equals(640));
    });
    test('should have correct value of height', () {
      var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      expect(surface.height, equals(480));
    });
    test('should have correct value of format', () {
      var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      expect(surface.format, equals(Format.CAIRO_FORMAT_ARGB32));
    });
    test('should have correct value of stride', () {
       var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
       expect(surface.stride, equals(2560));
    });
  });
}