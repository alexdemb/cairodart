part of cairodart.test;

runPointTests() {
  group('Point', () {
    test('should have correct value of x', () {
      var p = new Point.from(10, 5);
      expect(p.x, equals(10));
    });
    test('should have correct value of y', () {
      var p = new Point.from(10, 5);
      expect(p.y, equals(5));
    });
    test('should have default zero value of x', () {
      var p = new Point();
      expect(p.x, equals(0));
    });
    test('should have default zero value of y', () {
      var p = new Point();
      expect(p.y, equals(0));
    });
    
  });
}