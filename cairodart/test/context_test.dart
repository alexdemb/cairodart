part of cairodart.test;

runContextTests() {
  group('Context', () {
    test('should be successfully created from ImageSurface', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
    });
    test('should successfully perform saving', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.save();
    });
    test('should successfully perform restoring', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.save();
      ctx.restore();
    });
    test('should successfully perform push group', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.pushGroup();
    });
    test('should successfully perform push group with content', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.pushGroupWithContent(Content.COLOR_ALPHA);
    });
    test('should successfully perform pop group to source', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.pushGroup();
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
      ctx.stroke();
    });
    test('should successfully paint', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.paint();
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
            
      ctx.arc(2.0, 3.0, 10.0, 10.0, 10.0);
    });
    test('should successfully add negative arc to path', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
                
      ctx.negativeArc(2.0, 3.0, 10.0, 10.0, 10.0);
    });
    test('should successfully add curve to points', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      
      ctx.curveTo(10.0, 10.0, 20.0, 20.0, 30.0, 30.0);
    });
  });
}

