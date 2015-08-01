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

runFontOptionsTests() {
  group('FontOptions', () {
    test('should be successfully created with default params', () {
      FontOptions opts = new FontOptions();
      
      expect(opts.hintMetrics, equals(HintMetrics.Default));
      expect(opts.hintStyle, equals(HintStyle.Default));
      expect(opts.antialias, equals(Antialias.Default));
    });
    test('should have Sucseess status when created', () {
      FontOptions opts = new FontOptions();

      expect(opts.status, equals(CairoStatus.Success));
    });
    test('should correctly get/set antialias', () {
      FontOptions opts = new FontOptions();
       
      opts.antialias = Antialias.Fast;
      expect(opts.antialias, equals(Antialias.Fast));
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
      
      opt1.antialias = Antialias.Gray;
      
      expect(opt1, isNot(equals(opt2)));
    });
    test('should correctly copy options', () {
      FontOptions opt1 = new FontOptions();
      opt1.antialias = Antialias.Fast;
      opt1.hintMetrics = HintMetrics.On;
      opt1.hintStyle = HintStyle.Medium;
      opt1.subpixelOrder = SubpixelOrder.Bgr;
      
      FontOptions opt2 = opt1.copy();
      
      expect(opt2.antialias, equals(Antialias.Fast));
      expect(opt2.hintMetrics, equals(HintMetrics.On));
      expect(opt2.hintStyle, equals(HintStyle.Medium));
      expect(opt2.subpixelOrder, equals(SubpixelOrder.Bgr));
    });
    test('should correctly merge one options to another', () {
      FontOptions opt1 = new FontOptions();
      FontOptions opt2 = new FontOptions();
      opt2.antialias = Antialias.Gray;
      opt2.subpixelOrder = SubpixelOrder.Vbgr;
      
      opt1.merge(opt2);
      
      expect(opt1.antialias, equals(Antialias.Gray));
      expect(opt1.subpixelOrder, equals(SubpixelOrder.Vbgr));
    });
    test('should have equal hashes for equal options and different hashes for different options', () {
      FontOptions opt1 = new FontOptions();
      FontOptions opt2 = new FontOptions();
      
      opt1.antialias = Antialias.Best;
      opt2.antialias = Antialias.Best;
     
      expect(opt1.hash, equals(opt2.hash));
      
      opt2.antialias = Antialias.Gray;
      
      expect(opt1.hash, isNot(equals(opt2.hash)));
    });
  });
}