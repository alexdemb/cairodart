part of cairodart.test;

runSurfaceTests() {
  group('Surface', () {
    test('should have correct value of content', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      Content content = surface.content;
      expect(content, equals(Content.COLOR_ALPHA));
    });
    test('should correctly get/set device offset', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      surface.deviceOffset = new Point.from(20.0, 25.0);
      
      Point offset = surface.deviceOffset;
      expect(offset.x, equals(20.0));
      expect(offset.y, equals(25.0));
    });
    test('should not support wrong mime type', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      bool supports = surface.supportsMimeType('wrong/mimetype');
      expect(supports, isFalse);
    });
    test('should not support cairo_show_text_glyphs() operation', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      expect(surface.hasShowTextGlyphs, isFalse);
    });
    test('should correctly get/set fallback resolution', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      surface.fallbackResolution = new Resolution(250.0, 120.0);
      
      expect(surface.fallbackResolution.xResolution, equals(250.0));
      expect(surface.fallbackResolution.yResolution, equals(120.0));
    });
  });
  group('Image Surface', () {
    test('should have correct value of width', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      expect(surface.width, equals(640));
    });
    test('should have correct value of height', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      expect(surface.height, equals(480));
    });
    test('should have correct value of format', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      expect(surface.format, equals(Format.ARGB32));
    });
    test('should have correct value of stride', () {
       var surface = new ImageSurface(Format.ARGB32, 640, 480);
       expect(surface.stride, equals(2560));
    });
    test('should have IMAGE surface type', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      expect(surface.surfaceType, equals(SurfaceType.IMAGE));
    });
    test('should correctly get/set data byte array', () {
      List<int> data = new List<int>.from([30,40,50,60,70,80,90,100]);
      var surface = new ImageSurface.forData(data, Format.ARGB32, 640, 480, Format.ARGB32.strideForWidth(640));

      List<int> imgData = surface.data;
      expect(imgData, equals(data));
    });
  });
  group('PDF surface', () {
    test('should correctly return list of supported versions', () {
      var pdfSurface = new PdfSurface(null, 640, 480);

      List<PdfVersion> supportedVersions = pdfSurface.versions;
      expect(supportedVersions, [PdfVersion.OnePointFour, PdfVersion.OnePointFive]);
    });
  });
}