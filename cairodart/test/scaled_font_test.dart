part of cairodart.test;

runScaledFontTests() {
  group('Scaled font', () {
    test('should correctly get/set font matrix', () {
      FontFace fontFace = new FontFace.userFont();
      Matrix fontMatrix = new Matrix.zero();
      Matrix ctm = new Matrix.zero();
      FontOptions opts = new FontOptions();

      ScaledFont scaledFont = new ScaledFont(fontFace, fontMatrix, ctm, opts);

      expect(scaledFont.fontMatrix, equals(fontMatrix));
    });
    test('should correctly get/set ctm', () {
      FontFace fontFace = new FontFace.userFont();
      Matrix fontMatrix = new Matrix.zero();
      Matrix ctm = new Matrix.zero();
      FontOptions opts = new FontOptions();

      ScaledFont scaledFont = new ScaledFont(fontFace, fontMatrix, ctm, opts);

      expect(scaledFont.ctm, equals(ctm));
    });
    test('should correctly get/set font options', () {
      FontFace fontFace = new FontFace.userFont();
      Matrix fontMatrix = new Matrix.zero();
      Matrix ctm = new Matrix.zero();
      FontOptions opts = new FontOptions();

      ScaledFont scaledFont = new ScaledFont(fontFace, fontMatrix, ctm, opts);

      expect(scaledFont.fontOptions, equals(opts));
    });
    
  });
}