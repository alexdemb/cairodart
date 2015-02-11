part of cairodart.test;

runPatternTests() {
  group('Pattern', () {
    test('should be successfully created from RGB', () {
      Pattern pattern = new Pattern.fromRgb(200.0, 200.0, 200.0);
    });
    test('should be successfully created from RGBA', () {
      Pattern pattern = new Pattern.fromRgba(200.0, 200.0, 200.0, 0.5);
    });
    test('should be successfully created for surface', () {
      Surface surface = new ImageSurface(Format.CAIRO_FORMAT_ARGB32, 640, 480);
      Pattern pattern = new Pattern.forSurface(surface);
    });
    test('should be successfully created linear', () {
      Pattern pattern = new Pattern.linear(10.0, 20.0, 30.0, 40.0);
    });
    test('should be successfully created radial', () {
      Pattern pattern = new Pattern.radial(10.0, 20.0, 5.0, 30.0, 40.0, 6.0);
    });
  });
  group('Mesh pattern', () {
    test('should be successfully created', () {
      MeshPattern pattern = new MeshPattern();
    });
    test('begin patch', () {
      MeshPattern pattern = new MeshPattern();
      pattern.beginPatch();
    });
    test('moveTo', () {
      MeshPattern pattern = new MeshPattern();
      pattern.beginPatch();
      pattern.moveTo(20.0, 30.0);
      pattern.endPatch();
    });
    test('lineTo', () {
      MeshPattern pattern = new MeshPattern();
      pattern.beginPatch();
      pattern.lineTo(20.0, 30.0);
      pattern.endPatch();
    });    
    test('curveTo', () {
      MeshPattern pattern = new MeshPattern();
      pattern.beginPatch();
      pattern.curveTo(10.0, 10.0, 20.0, 20.0, 30.0, 30.0);
      pattern.endPatch();
    });    
    test('set control point', () {
      MeshPattern pattern = new MeshPattern();
      pattern.beginPatch();
      pattern.setControlPoint(0, new Point.from(20.0, 10.0));
    });    
    test('get control point', () {
      MeshPattern pattern = new MeshPattern();
      pattern.beginPatch();
      pattern.setControlPoint(0, new Point.from(20.0, 10.0));
      Point p = pattern.getControlPoint(0, 0);
      
      expect(0.0, equals(p.x));
      expect(0.0, equals(p.y));
    });    
    test('set corner color', () {
      MeshPattern pattern = new MeshPattern();
      pattern.beginPatch();
      pattern.setCornerColor(0, new Color.rgb(30.0, 10.0, 50.0));
      
    });
    test('get corner color', () {
      MeshPattern pattern = new MeshPattern();
      pattern.beginPatch();
      pattern.setCornerColor(0, new Color.rgb(30.0, 10.0, 50.0));
      Color color = pattern.getCornerColor(0, 0);
    });
    test('get patch count', () {
      MeshPattern pattern = new MeshPattern();
      pattern.beginPatch();
      int count = pattern.patchCount;
      
      expect(0, equals(count));      
    });
    
  });
}