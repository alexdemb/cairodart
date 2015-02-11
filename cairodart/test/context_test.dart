part of cairodart.test;

runContextTests() {
  group('Context', () {
    test('should be successfully created from ImageSurface', () {
      Context ctx = new Context(new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480));
    });
    test('should successfully perform saving', () {
      Context ctx = new Context(new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480));
      ctx.save();
    });
    test('should successfully perform restoring', () {
      Context ctx = new Context(new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480));
      ctx.save();
      ctx.restore();
    });
    test('should successfully perform push group', () {
      Context ctx = new Context(new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480));
      ctx.pushGroup();
    });
    test('should successfully perform push group with content', () {
      Context ctx = new Context(new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480));
      ctx.pushGroupWithContent(Content.CAIRO_CONTENT_COLOR_ALPHA);
    });
    test('should successfully perform pop group to source', () {
      Context ctx = new Context(new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480));
      ctx.pushGroup();
      ctx.popGroupToSource();
    });
    test('should successfully set RGB', () {
      Context ctx = new Context(new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480));
      ctx.setSourceRgb(255.0, 255.0, 255.0);
    });
    test('should successfully set RGBA', () {
      Context ctx = new Context(new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480));
      ctx.setSourceRgba(255.0, 255.0, 255.0, 0.5);
    });
    test('should successfully stroke', () {
      Context ctx = new Context(new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480));
      ctx.stroke();
    });
    test('should successfully paint', () {
      Context ctx = new Context(new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480));
      ctx.paint();
    });
    test('should return correct target', () {
      var surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      Context ctx = new Context(surface);
      expect(ctx.target, surface);
    });
  });
}

