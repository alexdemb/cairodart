part of cairodart.test;

runMatrixTests() {
  group('Matrix', () {
    test('should have valid values of elements', () {
      Matrix matrix = new Matrix(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      
      expect(matrix.xx, equals(1.0));
      expect(matrix.yx, equals(2.0));
      expect(matrix.xy, equals(3.0));
      expect(matrix.yy, equals(4.0));
      expect(matrix.x0, equals(5.0));
      expect(matrix.y0, equals(6.0));
    });
    test('should have valid values of elements after init', () {
      Matrix matrix = new Matrix.zero();
      matrix.init(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
          
      expect(matrix.xx, equals(1.0));
      expect(matrix.yx, equals(2.0));
      expect(matrix.xy, equals(3.0));
      expect(matrix.yy, equals(4.0));
      expect(matrix.x0, equals(5.0));
      expect(matrix.y0, equals(6.0));
    });
    test('should have valud values of elements after initIdentify', () {
      Matrix matrix = new Matrix.zero();
      matrix.initIdentity();
      
      expect(matrix.xx, equals(1.0));
      expect(matrix.yx, equals(0.0));
      expect(matrix.xy, equals(0.0));
      expect(matrix.yy, equals(1.0));
      expect(matrix.x0, equals(0.0));
      expect(matrix.y0, equals(0.0));
    });
    test('should have valid values of elements after initTranslate', () {
      Matrix matrix = new Matrix.zero();
      matrix.initTranslate(2.0, 4.0);
      
      expect(matrix.xx, equals(1.0));
      expect(matrix.yx, equals(0.0));
      expect(matrix.xy, equals(0.0));
      expect(matrix.yy, equals(1.0));
      expect(matrix.x0, equals(2.0));
      expect(matrix.y0, equals(4.0));
    });
    test('should have valid values of elements after initScale', () {
      Matrix matrix = new Matrix.zero();
      matrix.initScale(2.0, 4.0);
      
      expect(matrix.xx, equals(2.0));
      expect(matrix.yx, equals(0.0));
      expect(matrix.xy, equals(0.0));
      expect(matrix.yy, equals(4.0));
      expect(matrix.x0, equals(0.0));
      expect(matrix.y0, equals(0.0));
    });
    test('should have valid values of elements after initRotate', () {
      Matrix matrix = new Matrix.zero();
      matrix.initRotate(3.141592653589793);
      
      expect(matrix.xx, equals(-1.0));
      expect(matrix.yx, equals(1.2246467991473532e-16));
      expect(matrix.xy, equals(-1.2246467991473532e-16));
      expect(matrix.yy, equals(-1.0));
      expect(matrix.x0, equals(0.0));
      expect(matrix.y0, equals(0.0));
    });    
    test('should have valid values of elements after translate', () {
      Matrix matrix = new Matrix(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      
      matrix.translate(3.0, 4.0);
      
      expect(matrix.xx, equals(1.0));
      expect(matrix.yx, equals(2.0));
      expect(matrix.xy, equals(3.0));
      expect(matrix.yy, equals(4.0));
      expect(matrix.x0, equals(20.0));
      expect(matrix.y0, equals(28.0));
    });    
    test('should have valid values of elements after scale', () {
      Matrix matrix = new Matrix(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      
      matrix.scale(2.0, 2.0);
      
      expect(matrix.xx, equals(2.0));
      expect(matrix.yx, equals(4.0));
      expect(matrix.xy, equals(6.0));
      expect(matrix.yy, equals(8.0));
      expect(matrix.x0, equals(5.0));
      expect(matrix.y0, equals(6.0));
    });    
    test('should have valid values of elements after rotate', () {
      Matrix matrix = new Matrix(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      
      matrix.rotate(2.0);
      
      expect(matrix.xx, equals(2.3117454439299028));
      expect(matrix.yx, equals(2.804896034208442));
      expect(matrix.xy, equals(-2.1577379364671088));
      expect(matrix.yy, equals(-3.4831821998399333));
      expect(matrix.x0, equals(5.0));
      expect(matrix.y0, equals(6.0));
    });    
    test('should have valid values of elements after invert', () {
      Matrix matrix = new Matrix(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      
      matrix.invert();
      
      expect(matrix.xx, equals(-2.0));
      expect(matrix.yx, equals(1.0));
      expect(matrix.xy, equals(1.5));
      expect(matrix.yy, equals(-0.5));
      expect(matrix.x0, equals(1.0));
      expect(matrix.y0, equals(-2.0));
    });        
    test('should have valid value of transform point', () {
      Matrix matrix = new Matrix(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
          
      Point p = matrix.transformPoint;
          
      expect(p.x, equals(5.0));
      expect(p.y, equals(6.0));
    });            
    test('should have valid value of transform distance', () {
      Matrix matrix = new Matrix(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
          
      Distance d = matrix.transformDistance;
          
      expect(d.dx, equals(0.0));
      expect(d.dy, equals(0.0));
    });            
    test('should produce correct matrix after multiplication', () {
      Matrix m1 = new Matrix(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      Matrix m2 = new Matrix(2.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      
      Matrix m3 = Matrix.multiply(m1, m2);
      
      expect(m3.xx, equals(8.0));
      expect(m3.yx, equals(10.0));
      expect(m3.xy, equals(18.0));
      expect(m3.yy, equals(22.0));
      expect(m3.x0, equals(33.0));
      expect(m3.y0, equals(40.0));            
    });
    
  });
}