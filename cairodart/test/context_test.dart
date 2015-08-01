///
/// This library is free software; you can redistribute it and/or
/// modify it under the terms of the GNU Lesser General Public
/// License as published by the Free Software Foundation; either
/// version 2.1 of the License, or (at your option) any later version.
///
/// This library is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
/// Lesser General Public License for more details.
///
/// You should have received a copy of the GNU Lesser General Public
/// License along with this library; if not, write to the Free Software
/// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
/// MA 02110-1301  USA
///

part of cairodart.test;

runContextTests() {
  group('Context', () {
    test('should have success status when created', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      expect(ctx.status, equals(CairoStatus.Success));
    });
    test('should successfully get/set source', () {
      Context ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      Pattern p = new SurfacePattern(new ImageSurface(Format.ARGB32, 500, 500));
      Pattern other = new MeshPattern();
      
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
    test('should return correct target', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      Context ctx = new Context(surface);
      expect(ctx.target, surface);
    });
    test('should correctly get/set line cap', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.lineCap = LineCap.Butt;
      expect(ctx.lineCap, equals(LineCap.Butt));

      ctx.lineCap = LineCap.Round;
      expect(ctx.lineCap, equals(LineCap.Round));

      ctx.lineCap = LineCap.Square;
      expect(ctx.lineCap, equals(LineCap.Square));
    });
    test('should correctly get/set line join', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));
      ctx.lineJoin = LineJoin.Miter;
      expect(ctx.lineJoin, equals(LineJoin.Miter));

      ctx.lineJoin = LineJoin.Round;
      expect(ctx.lineJoin, equals(LineJoin.Round));

      ctx.lineJoin = LineJoin.Bevel;
      expect(ctx.lineJoin, equals(LineJoin.Bevel));
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

      ctx.operator = Operator.Add;
      expect(ctx.operator, equals(Operator.Add));

      ctx.operator = Operator.Atop;
      expect(ctx.operator, equals(Operator.Atop));

      ctx.operator = Operator.Clear;
      expect(ctx.operator, equals(Operator.Clear));

      ctx.operator = Operator.ColorBurn;
      expect(ctx.operator, equals(Operator.ColorBurn));

      ctx.operator = Operator.ColorDodge;
      expect(ctx.operator, equals(Operator.ColorDodge));

      ctx.operator = Operator.Darken;
      expect(ctx.operator, equals(Operator.Darken));

      ctx.operator = Operator.Dest;
      expect(ctx.operator, equals(Operator.Dest));

      ctx.operator = Operator.DestAtop;
      expect(ctx.operator, equals(Operator.DestAtop));

      ctx.operator = Operator.DestIn;
      expect(ctx.operator, equals(Operator.DestIn));

      ctx.operator = Operator.DestOut;
      expect(ctx.operator, equals(Operator.DestOut));

      ctx.operator = Operator.DestOver;
      expect(ctx.operator, equals(Operator.DestOver));

      ctx.operator = Operator.Difference;
      expect(ctx.operator, equals(Operator.Difference));

      ctx.operator = Operator.Exclusion;
      expect(ctx.operator, equals(Operator.Exclusion));

      ctx.operator = Operator.HardLight;
      expect(ctx.operator, equals(Operator.HardLight));

      ctx.operator = Operator.HSLColor;
      expect(ctx.operator, equals(Operator.HSLColor));

      ctx.operator = Operator.HSLHUE;
      expect(ctx.operator, equals(Operator.HSLHUE));

      ctx.operator = Operator.HSLLuminosity;
      expect(ctx.operator, equals(Operator.HSLLuminosity));

      ctx.operator = Operator.HSLSaturation;
      expect(ctx.operator, equals(Operator.HSLSaturation));

      ctx.operator = Operator.In;
      expect(ctx.operator, equals(Operator.In));

      ctx.operator = Operator.Lighten;
      expect(ctx.operator, equals(Operator.Lighten));

      ctx.operator = Operator.Multiply;
      expect(ctx.operator, equals(Operator.Multiply));

      ctx.operator = Operator.Out;
      expect(ctx.operator, equals(Operator.Out));

      ctx.operator = Operator.Over;
      expect(ctx.operator, equals(Operator.Over));

      ctx.operator = Operator.Overlay;
      expect(ctx.operator, equals(Operator.Overlay));

      ctx.operator = Operator.Saturate;
      expect(ctx.operator, equals(Operator.Saturate));

      ctx.operator = Operator.Screen;
      expect(ctx.operator, equals(Operator.Screen));

      ctx.operator = Operator.SoftLight;
      expect(ctx.operator, equals(Operator.SoftLight));

      ctx.operator = Operator.Source;
      expect(ctx.operator, equals(Operator.Source));

      ctx.operator = Operator.Xor;
      expect(ctx.operator, equals(Operator.Xor));
    });
    test('should successfully get/set fill rule', () {
      var ctx = new Context(new ImageSurface(Format.ARGB32, 640, 480));

      ctx.fillRule = FillRule.Winding;
      expect(ctx.fillRule, equals(FillRule.Winding));

      ctx.fillRule = FillRule.EvenOdd;
      expect(ctx.fillRule, equals(FillRule.EvenOdd));
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

      ctx.antialias = Antialias.Gray;
      expect(ctx.antialias, equals(Antialias.Gray));
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
      expect(rectList.status, equals(CairoStatus.Success));
      expect(rectList.rectangles.length, equals(3));
      
      expect(rectList.rectangles[0], equals(new Rectangle(0, 0, 20, 10)));
      expect(rectList.rectangles[1], equals(new Rectangle(0, 10, 30, 10)));
      expect(rectList.rectangles[2], equals(new Rectangle(10, 20, 20, 10)));
      
      rectList.destroy();
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
