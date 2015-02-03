part of cairodart.test;

runSurfaceTests() {
  group('Surface', () {
    test('should have correct value of content', () {
      var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      Content content = surface.content;
      expect(content, equals(Content.CAIRO_CONTENT_COLOR_ALPHA));
    });
    test('should correctly get/set device offset', () {
      var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      surface.deviceOffset = new Point.from(20.0, 25.0);
      
      Point offset = surface.deviceOffset;
      expect(offset.x, equals(20.0));
      expect(offset.y, equals(25.0));
    });
    test('should not support wrong mime type', () {
      var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      bool supports = surface.supportsMimeType('wrong/mimetype');
      expect(supports, isFalse);
    });
    test('should not support cairo_show_text_glyphs() operation', () {
      var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      expect(surface.hasShowTextGlyphs, isFalse);
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