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
      Surface surface = new ImageSurface(Format.ARGB32, 640, 480);
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
    test('should correctly obtain linear points for linear pattern', () {
      Pattern pattern = new Pattern.linear(10.0, 15.0, 100.0, 150.0);
      List<Point> points = pattern.linearPoints;
      
      expect(points[0], (Point p) => p.x == 10.0 && p.y == 15.0);
      expect(points[1], (Point p) => p.x == 100.0 && p.y == 150.0);
    });
    test('should correctly obtain radial circles for radial pattern', () {
      Pattern pattern = new Pattern.radial(10.0, 15.0, 20.0, 100.0, 150.0, 30.0);
      List<Circle> circles = pattern.radialCircles;
      
      expect(circles[0], (Circle c) => c.x == 10.0 && c.y == 15.0 && c.radius == 20.0);
      expect(circles[1], (Circle c) => c.x == 100.0 && c.y == 150.0 && c.radius == 30.0);
    });
    test('should correctly get/set extend', () {
      Pattern pattern = new Pattern.linear(10.0, 10.0, 20.0, 20.0);
      expect(pattern.extend, equals(Extend.PAD));
      
      pattern.extend = Extend.REFLECT;
      
      expect(pattern.extend, equals(Extend.REFLECT));
    });
    test('should correctly get/set filter', () {
      Pattern pattern = new Pattern.linear(10.0, 10.0, 20.0, 20.0);
      expect(pattern.filter, equals(Filter.GOOD));
      
      pattern.filter = Filter.BEST;
      
      expect(pattern.filter, equals(Filter.BEST));
    });
    test('should have correct pattern type', () {
      Pattern pattern = new Pattern.mesh();
      expect(pattern.patternType, equals(PatternType.MESH));
      
      pattern = new Pattern.fromRgb(0.0, 0.0, 0.0);
      expect(pattern.patternType, equals(PatternType.SOLID));
      
      pattern = new Pattern.fromRgba(0.0, 0.0, 0.0, 0.0);
      expect(pattern.patternType, equals(PatternType.SOLID));
      
      pattern = new Pattern.linear(0.0, 0.0, 10.0, 10.0);
      expect(pattern.patternType, equals(PatternType.LINEAR));
      
      pattern = new Pattern.radial(0.0, 0.0, 5.0, 10.0, 10.0, 10.0);
      expect(pattern.patternType, equals(PatternType.RADIAL));
      
      Surface surface = new ImageSurface(Format.ARGB32, 10, 10);
      pattern = new Pattern.forSurface(surface);
      expect(pattern.patternType, equals(PatternType.SURFACE));
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