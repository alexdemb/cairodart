part of cairodart.test;

runContextTests() {
  group('Context', () {
    test('should be successfully created from ImageSurface', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
    });
    test('should successfully perform saving/restoring', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.save();
      ctx.restore();
    });
    test('should successfully get/set source', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      Pattern p = new SurfacePattern(new ImageSurface(Format.ARGB32, 500, 500));
      Pattern other = new Pattern.mesh();
      
      ctx.source = p;
      
      expect(ctx.source, equals(p));
      expect(ctx.source, isNot(equals(other)));      
    });
    test('should successfully perform push/pop group', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.pushGroup();
      Pattern p = ctx.popGroup();
      expect(p, isNotNull);
    });
    test('should successfully perform push group with content/pop group', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.pushGroupWithContent(Content.COLOR_ALPHA);
      ctx.popGroupToSource();
    });
    test('should successfully set RGB', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.setSourceRgb(255.0, 255.0, 255.0);
    });
    test('should successfully set RGBA', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.setSourceRgba(255.0, 255.0, 255.0, 0.5);
    });
    test('should successfully stroke', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.lineTo(20.0, 20.0);
      ctx.stroke();
      expect(ctx.currentPoint, equals(new Point()));
    });
    test('should successfully stroke and preserve path', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.lineTo(20.0, 20.0);
      ctx.strokePreserve();
      expect(ctx.currentPoint, equals(new Point.from(20, 20)));
    });
    test('should correctly determine if point is in stroke', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));

      ctx.lineWidth = 1.0;
      ctx.moveTo(0.0, 0.0);
      ctx.lineTo(100.0, 100.0);
      ctx.strokePreserve();

      expect(ctx.inStroke(49, 50), isFalse);
      expect(ctx.inStroke(50, 50), isTrue);
      expect(ctx.inStroke(51, 50), isFalse);
    });
    test('should correctly determine if point is in stroke when Point class is used', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));

      ctx.lineWidth = 1.0;
      ctx.moveTo(0.0, 0.0);
      ctx.lineTo(100.0, 100.0);
      ctx.strokePreserve();

      expect(ctx.pointInStroke(new Point.from(49, 50)), isFalse);
      expect(ctx.pointInStroke(new Point.from(50, 50)), isTrue);
      expect(ctx.pointInStroke(new Point.from(51, 50)), isFalse);
    });
    test('should successully determine stroke extents', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));

      ctx.lineWidth = 0.5;
      
      
      ctx.moveTo(1.0, 0.0);
      ctx.lineTo(50.0, 0.0);
      ctx.lineTo(50.0, 50.0);
      ctx.lineTo(0.0, 50.0);
      ctx.lineTo(0.0, 0.0);
      ctx.strokePreserve();

      var expectedRect = new Rectangle(-0.25, -0.25, 50.5, 50.5);
      var actual = ctx.strokeExtents;
      expect(actual.x, closeTo(expectedRect.x, 0.01));
      expect(actual.y, closeTo(expectedRect.y, 0.01));
      expect(actual.width, closeTo(expectedRect.width, 0.01));
      expect(actual.height, closeTo(expectedRect.height, 0.01));
    });    
    test('should successfully paint', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.paint();
    });
    test('should successfully paint with alpha', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.paintWithAlpha(0.5);
    });    
    test('should return correct target', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      Context ctx = new Context(surface);
      expect(ctx.target, surface);
    });
    test('should correctly get/set line cap', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.lineCap = LineCap.BUTT;
      expect(ctx.lineCap, equals(LineCap.BUTT));

      ctx.lineCap = LineCap.ROUND;
      expect(ctx.lineCap, equals(LineCap.ROUND));

      ctx.lineCap = LineCap.SQUARE;
      expect(ctx.lineCap, equals(LineCap.SQUARE));
    });
    test('should correctly get/set line join', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.lineJoin = LineJoin.MITER;
      expect(ctx.lineJoin, equals(LineJoin.MITER));

      ctx.lineJoin = LineJoin.ROUND;
      expect(ctx.lineJoin, equals(LineJoin.ROUND));

      ctx.lineJoin = LineJoin.BEVEL;
      expect(ctx.lineJoin, equals(LineJoin.BEVEL));
    });
    test('should correctly get/set line width', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.lineWidth = 3.0;
      expect(ctx.lineWidth, equals(3.0));
    });
    test('should correctly get/set miter limit', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.miterLimit = 20.0;
      expect(ctx.miterLimit, equals(20.0));
    });
    test('should correctly get/set operator', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.operator = Operator.ADD;
      expect(ctx.operator, equals(Operator.ADD));

      ctx.operator = Operator.ATOP;
      expect(ctx.operator, equals(Operator.ATOP));

      ctx.operator = Operator.CLEAR;
      expect(ctx.operator, equals(Operator.CLEAR));

      ctx.operator = Operator.COLOR_BURN;
      expect(ctx.operator, equals(Operator.COLOR_BURN));

      ctx.operator = Operator.COLOR_DODGE;
      expect(ctx.operator, equals(Operator.COLOR_DODGE));

      ctx.operator = Operator.DARKEN;
      expect(ctx.operator, equals(Operator.DARKEN));

      ctx.operator = Operator.DEST;
      expect(ctx.operator, equals(Operator.DEST));

      ctx.operator = Operator.DEST_ATOP;
      expect(ctx.operator, equals(Operator.DEST_ATOP));

      ctx.operator = Operator.DEST_IN;
      expect(ctx.operator, equals(Operator.DEST_IN));

      ctx.operator = Operator.DEST_OUT;
      expect(ctx.operator, equals(Operator.DEST_OUT));

      ctx.operator = Operator.DEST_OVER;
      expect(ctx.operator, equals(Operator.DEST_OVER));

      ctx.operator = Operator.DIFFERENCE;
      expect(ctx.operator, equals(Operator.DIFFERENCE));

      ctx.operator = Operator.EXCLUSION;
      expect(ctx.operator, equals(Operator.EXCLUSION));

      ctx.operator = Operator.HARD_LIGHT;
      expect(ctx.operator, equals(Operator.HARD_LIGHT));

      ctx.operator = Operator.HSL_COLOR;
      expect(ctx.operator, equals(Operator.HSL_COLOR));

      ctx.operator = Operator.HSL_HUE;
      expect(ctx.operator, equals(Operator.HSL_HUE));

      ctx.operator = Operator.HSL_LUMINOSITY;
      expect(ctx.operator, equals(Operator.HSL_LUMINOSITY));

      ctx.operator = Operator.HSL_SATURATION;
      expect(ctx.operator, equals(Operator.HSL_SATURATION));

      ctx.operator = Operator.IN;
      expect(ctx.operator, equals(Operator.IN));

      ctx.operator = Operator.LIGHTEN;
      expect(ctx.operator, equals(Operator.LIGHTEN));

      ctx.operator = Operator.MULTIPLY;
      expect(ctx.operator, equals(Operator.MULTIPLY));

      ctx.operator = Operator.OUT;
      expect(ctx.operator, equals(Operator.OUT));

      ctx.operator = Operator.OVER;
      expect(ctx.operator, equals(Operator.OVER));

      ctx.operator = Operator.OVERLAY;
      expect(ctx.operator, equals(Operator.OVERLAY));

      ctx.operator = Operator.SATURATE;
      expect(ctx.operator, equals(Operator.SATURATE));

      ctx.operator = Operator.SCREEN;
      expect(ctx.operator, equals(Operator.SCREEN));

      ctx.operator = Operator.SOFT_LIGHT;
      expect(ctx.operator, equals(Operator.SOFT_LIGHT));

      ctx.operator = Operator.SOURCE;
      expect(ctx.operator, equals(Operator.SOURCE));

      ctx.operator = Operator.XOR;
      expect(ctx.operator, equals(Operator.XOR));
    });
    test('should successfully get/set fill rule', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.fillRule = FillRule.WINDING;
      expect(ctx.fillRule, equals(FillRule.WINDING));

      ctx.fillRule = FillRule.EVEN_ODD;
      expect(ctx.fillRule, equals(FillRule.EVEN_ODD));
    });
    test('should correctly determine if current path contains current point', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      expect(ctx.hasCurrentPoint, isFalse);

      ctx.moveTo(200.0, 200.0);

      expect(ctx.hasCurrentPoint, isTrue);
    });
    test('should correctly add rectengular path', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.rectangleByCoords(10.0, 10.0, 20.0, 20.0);

      ctx.moveTo(12.0, 12.0);

      expect(ctx.hasCurrentPoint, isTrue);
    });
    test('should correctly add rectengular path for rectangle', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.rectangle(new Rectangle(10, 10, 20, 20));

      ctx.moveTo(12.0, 12.0);

      expect(ctx.hasCurrentPoint, isTrue);
    });
    test('should correctly build path using lineTo', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);
      ctx.lineTo(30.0, 10.0);
      ctx.lineTo(30.0, 30.0);
      ctx.lineTo(10.0, 30.0);

      expect(ctx.hasCurrentPoint, isTrue);
    });
    test('should correctly build path using lineToPoint', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);
      ctx.lineToPoint(new Point.from(30.0, 10.0));
      ctx.lineToPoint(new Point.from(30.0, 30.0));
      ctx.lineToPoint(new Point.from(10.0, 30.0));

      expect(ctx.hasCurrentPoint, isTrue);
    });
    test('should correctly return current point', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);

      expect(ctx.currentPoint, equals(new Point.from(10.0, 10.0)));
    });
    test('should successfully create and close path and subpath', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);

      ctx.newPath();

      expect(ctx.hasCurrentPoint, isFalse);

      ctx.closePath();

      ctx.moveTo(12.0, 12.0);

      ctx.newSubpath();

      expect(ctx.hasCurrentPoint, isFalse);

      ctx.closePath();

    });
    test('should successfully add arc to path', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.arc(10.0, 10.0, 3.0, 30.0, 30.0);

      expect(ctx.currentPoint, equals(new Point.from(10.4609375, 7.03515625)));
    });
    test('should successfully add negative arc to path', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.negativeArc(10.0, 10.0, 3.0, 30.0, 30.0);

      expect(ctx.currentPoint, equals(new Point.from(10.4609375, 7.03515625)));
    });
    test('should successfully add curve to points', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.curveTo(10.0, 10.0, 20.0, 20.0, 30.0, 30.0);

      expect(ctx.currentPoint, new Point.from(30.0, 30.0));
    });
    test('should successfully add curve to points relative to current', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);

      ctx.relativeCurveTo(10.0, 10.0, 20.0, 20.0, 30.0, 30.0);

      expect(ctx.currentPoint, new Point.from(40.0, 40.0));
    });
    test('should correctly move from current point', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);

      ctx.relativeMoveTo(20.0, 20.0);

      expect(ctx.currentPoint, equals(new Point.from(30.0, 30.0)));
    });
    test('should correctly move from current point to another', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);

      ctx.relativeMoveToPoint(new Point.from(20.0, 20.0));

      expect(ctx.currentPoint, equals(new Point.from(30.0, 30.0)));
    });
    test('should correctly add line from current point', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);

      ctx.relativeLineTo(20.0, 20.0);

      expect(ctx.currentPoint, equals(new Point.from(30.0, 30.0)));
    });
    test('should correctly add line from current point to another', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);

      ctx.relativeLineToPoint(new Point.from(20.0, 20.0));

      expect(ctx.currentPoint, equals(new Point.from(30.0, 30.0)));
    });
    test('should return empty rectangle as an path extents', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      var extents = ctx.pathExtents;
      expect(extents, equals(new Rectangle(0, 0, 0, 0)));
    });
    test('should return correct path extents', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(20.0, 20.0);
      ctx.lineTo(40.0, 40.0);

      var extents = ctx.pathExtents;
      expect(extents, equals(new Rectangle(20, 20, 60, 60)));
    });
    test('should correctly get/set antialias', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.antialias = Antialias.GRAY;
      expect(ctx.antialias, equals(Antialias.GRAY));
    });
    test('should correctly get/set tolerance', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.tolerance = 2.1;
      expect(ctx.tolerance, equals(2.1));
    });
    test('should successfully clip', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);
      ctx.clip();
      expect(ctx.currentPoint, isNot(equals(new Point.from(10.0, 10.0))));
    });
    test('should successfully clip and preserve path', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);
      ctx.clipPreserve();
      expect(ctx.currentPoint, equals(new Point.from(10.0, 10.0)));
    });
    test('should correctly determine if point is in clip', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));

      ctx.moveTo(0.0, 0.0);
      ctx.lineTo(100.0, 100.0);
      ctx.lineTo(0.0, 100.0);
      ctx.lineTo(0.0, 0.0);
      ctx.clipPreserve();

      expect(ctx.inClip(49, 50), isTrue);
      expect(ctx.inClip(50, 50), isTrue);
      expect(ctx.inClip(51, 50), isFalse);
    });
    test('should correctly determine if point is in clip when Point class is used', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));

      ctx.moveTo(0.0, 0.0);
      ctx.lineTo(100.0, 100.0);
      ctx.lineTo(0.0, 100.0);
      ctx.lineTo(0.0, 0.0);
      ctx.clipPreserve();

      expect(ctx.pointInClip(new Point.from(49, 50)), isTrue);
      expect(ctx.pointInClip(new Point.from(50, 50)), isTrue);
      expect(ctx.pointInClip(new Point.from(51, 50)), isFalse);
    });
    test('should successully reset clip', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));

      ctx.moveTo(0.0, 0.0);
      ctx.lineTo(100.0, 100.0);
      ctx.lineTo(0.0, 100.0);
      ctx.lineTo(0.0, 0.0);
      ctx.clipPreserve();
      ctx.resetClip();

      expect(ctx.inClip(49, 50), isTrue);
      expect(ctx.inClip(50, 50), isTrue);
      expect(ctx.inClip(51, 50), isTrue);
    });
    test('should successully determine clip extents', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));

      ctx.moveTo(0.0, 0.0);
      ctx.lineTo(50.0, 60.0);
      ctx.lineTo(0.0, 50.0);
      ctx.lineTo(0.0, 0.0);
      ctx.clipPreserve();

      expect(ctx.clipExtents, new Rectangle(0, 0, 50, 60));

    });
    test('should successfully clip', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);
      ctx.fill();
      expect(ctx.currentPoint, isNot(equals(new Point.from(10.0, 10.0))));
    });
    test('should successfully clip and preserve path', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.moveTo(10.0, 10.0);
      ctx.fillPreserve();
      expect(ctx.currentPoint, equals(new Point.from(10.0, 10.0)));
    });
    test('should successully determine fill extents', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));

      ctx.moveTo(0.0, 0.0);
      ctx.lineTo(50.0, 60.0);
      ctx.lineTo(0.0, 50.0);
      ctx.lineTo(0.0, 0.0);
      ctx.fillPreserve();

      expect(ctx.fillExtents, new Rectangle(0, 0, 50, 60));
    });
    test('should correctly determine if point is in fill', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));

      ctx.moveTo(0.0, 0.0);
      ctx.lineTo(100.0, 100.0);
      ctx.lineTo(0.0, 100.0);
      ctx.lineTo(0.0, 0.0);
      ctx.fillPreserve();

      expect(ctx.inFill(49, 50), isTrue);
      expect(ctx.inFill(50, 50), isTrue);
      expect(ctx.inFill(51, 50), isFalse);
    });
    test('should correctly determine if point is in fill when Point class is used', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));

      ctx.moveTo(0.0, 0.0);
      ctx.lineTo(100.0, 100.0);
      ctx.lineTo(0.0, 100.0);
      ctx.lineTo(0.0, 0.0);
      ctx.fillPreserve();

      expect(ctx.pointInFill(new Point.from(49, 50)), isTrue);
      expect(ctx.pointInFill(new Point.from(50, 50)), isTrue);
      expect(ctx.pointInFill(new Point.from(51, 50)), isFalse);
    });
    test('should correctly return the current clip region as a list of rectangles in user coordinates', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));
      
      ctx.moveTo(0.0, 0.0);
      ctx.rectangle(new Rectangle(0, 0, 20, 20));
      ctx.rectangle(new Rectangle(10, 10, 20, 20));
      ctx.clip();
      
      RectangleList rectList = ctx.copyClipRectangleList();
      expect(rectList.status, equals(CairoStatus.SUCCESS));
      expect(rectList.rectangles.length, equals(3));
      
      expect(rectList.rectangles[0], equals(new Rectangle(0, 0, 20, 10)));
      expect(rectList.rectangles[1], equals(new Rectangle(0, 10, 30, 10)));
      expect(rectList.rectangles[2], equals(new Rectangle(10, 20, 20, 10)));
      
      rectList.destroy();
    });
    test('should correctly add mask', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));
      Pattern pattern = new Pattern.mesh();
      
      ctx.mask(pattern); 
      
      // TODO: Implement correct assertions.
    });
    test('should correctly add surface mask', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));
      Surface surface = new ImageSurface(Format.ARGB32, 30, 40);
      Point p = new Point.from(10, 10);
      
      ctx.maskSurface(surface, p);
      
      // TODO: Implement correct assertions.
    });
    test('should successfully copy and show pages', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));
      ctx.copyPage();
      ctx.showPage();
      
      // TODO: Implement correct assertions.
    });
    test('should successfully get/set dash', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));
      var dash = new Dash([1.1, 1.5], 0.2);
      ctx.dash = dash;
      
      int count = ctx.dashCount;
      expect(count, equals(2));
      expect(ctx.dash, equals(dash));
    });
    test('should correctly set source surface', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 100, 100));
      ctx.setSourceSurface(new ImageSurface(Format.ARGB32, 50, 50), 50.0, 50.0);
      
      Pattern p = ctx.source;
      expect(p, isNotNull);
    });
    test('should correctly get initial surface as group target', () {
      var original = new ImageSurface(Format.ARGB32, 100, 100);
      var ctx = new Context(original);
      
      expect(ctx.groupTarget, equals(original));
    });
  });
}
