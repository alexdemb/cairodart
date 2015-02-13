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
    test('should correctly set/get color stop', () {
      Pattern pattern = new Pattern.linear(0.0, 0.0, 800.0, 800.0);
      pattern.addColorStop(new ColorStop(new Color.rgba(0.5, 0.6, 0.7, 0.5), 0.4));
      
      expect(pattern.colorStopCount, equals(1));
      pattern.addColorStop(new ColorStop(new Color.rgba(0.6, 0.5, 0.4, 0.3), 0.2));
      expect(pattern.colorStopCount, equals(2));
      
      expect(pattern.colorStopAt(1), (ColorStop stop) {
        return stop.offset == 0.4 &&
                stop.color.red == 0.5 &&
                stop.color.green == 0.6 &&
                stop.color.blue == 0.7 &&
                stop.color.alpha == 0.5;
      });
      
      
      expect(pattern.colorStopAt(0), (ColorStop stop) {
        return stop.offset == 0.2 &&
                stop.color.red == 0.6 &&
                stop.color.green == 0.5 &&
                stop.color.blue == 0.4 &&
                stop.color.alpha == 0.3;
      });
      
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