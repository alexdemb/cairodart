part of cairodart.test;

runFontOptionsTests() {
  group('FontOptions', () {
    test('should be successfully created with default params', () {
      FontOptions opts = new FontOptions();
      
      expect(opts.hintMetrics, equals(HintMetrics.Default));
      expect(opts.hintStyle, equals(HintStyle.Default));
      expect(opts.antialias, equals(Antialias.DEFAULT));
    });
    test('should correctly get/set antialias', () {
      FontOptions opts = new FontOptions();
       
      opts.antialias = Antialias.FAST;
      expect(opts.antialias, equals(Antialias.FAST));
    });
    test('should correctly get/set hintStyle', () {
      FontOptions opts = new FontOptions();
            
      opts.hintStyle = HintStyle.Full;
      expect(opts.hintStyle, equals(HintStyle.Full));
    });
    test('should correctly get/set hintMetrics', () {
      FontOptions opts = new FontOptions();
       
      opts.hintMetrics = HintMetrics.On;
      expect(opts.hintMetrics, equals(HintMetrics.On));
    });
    test('should correctly compare font options', () {
      FontOptions opt1 = new FontOptions();
      FontOptions opt2 = new FontOptions();
      
      expect(opt1, equals(opt2));
      
      opt1.antialias = Antialias.GRAY;
      
      expect(opt1, isNot(equals(opt2)));
    });
    test('should correctly copy options', () {
      FontOptions opt1 = new FontOptions();
      opt1.antialias = Antialias.FAST;
      opt1.hintMetrics = HintMetrics.On;
      opt1.hintStyle = HintStyle.Medium;
      opt1.subpixelOrder = SubpixelOrder.Bgr;
      
      FontOptions opt2 = opt1.copy();
      
      expect(opt2.antialias, equals(Antialias.FAST));
      expect(opt2.hintMetrics, equals(HintMetrics.On));
      expect(opt2.hintStyle, equals(HintStyle.Medium));
      expect(opt2.subpixelOrder, equals(SubpixelOrder.Bgr));
    });
    test('should correctly merge one options to another', () {
      FontOptions opt1 = new FontOptions();
      FontOptions opt2 = new FontOptions();
      opt2.antialias = Antialias.GRAY;
      opt2.subpixelOrder = SubpixelOrder.Vbgr;
      
      opt1.merge(opt2);
      
      expect(opt1.antialias, equals(Antialias.GRAY));
      expect(opt1.subpixelOrder, equals(SubpixelOrder.Vbgr));
    });
    test('should have equal hashes for equal options and different hashes for different options', () {
      FontOptions opt1 = new FontOptions();
      FontOptions opt2 = new FontOptions();
      
      opt1.antialias = Antialias.BEST;
      opt2.antialias = Antialias.BEST;
     
      expect(opt1.hash, equals(opt2.hash));
      
      opt2.antialias = Antialias.GRAY;
      
      expect(opt1.hash, isNot(equals(opt2.hash)));
    });
  });
}