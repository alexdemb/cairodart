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

runSurfaceTests() {
  group('Surface', () {
    test('should have correct value of content', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      Content content = surface.content;
      expect(content, equals(Content.ColorAndAlpha));
    });
    test('should have Success status when created', () {
      var surface = new ImageSurface(Format.ARGB32, 640, 480);
      expect(surface.status, equals(CairoStatus.Success));
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
      expect(surface.surfaceType, equals(SurfaceType.Image));
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
      expect(supportedVersions, unorderedEquals([PdfVersion.OnePointFour, PdfVersion.OnePointFive]));
    });
  });
  group('PostScript surface', () {
    test('should correctly return list of supported levels', () {
      var psSurface = new PostScriptSurface(null, 640, 480);

      List<PostScriptLevel> levels = psSurface.levels;

      expect(levels, unorderedEquals([PostScriptLevel.LevelTwo, PostScriptLevel.LevelThree]));
    });
    test('should correctly get/set encapsulated post script', () {
      var psSurface = new PostScriptSurface(null, 640, 480);
      psSurface.encapsulated = true;
      expect(psSurface.encapsulated, isTrue);
    });
  });
  group('SVG surface', () {
    test('should correctly return list of supported versions', () {
      var svg = new SvgSurface(null, 640, 480);

      expect(svg.versions, unorderedEquals([SvgVersion.OnePointOne, SvgVersion.OnePointTwo]));
    });
  });
  group('Recording surface', () {
    test('should correctly return if surface is bound to extents', () {
      var extents = <Rectangle>[new Rectangle(0, 0, 20, 20), new Rectangle(20, 20, 30, 30)];
      var surface = new RecordingSurface(Content.ColorAndAlpha, extents);

      bool isBounded = surface.getExtents(extents);

      expect(isBounded, isTrue);
    });
    test('should correctly return ink extents', () {
      var surface = new RecordingSurface(Content.ColorAndAlpha, null);
      Rectangle res = surface.inkExtents;
      expect(res, equals(new Rectangle(0,0,0,0)));
    });
  });

}