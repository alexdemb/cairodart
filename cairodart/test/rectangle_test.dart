part of cairodart.test;

runRectangleTests() {
  group('Rectangle', () {
    test('should have correct values of x,y,width and height after creation', () {
      Rectangle rect = new Rectangle(10, 15, 100, 150);
      expect(rect.x, equals(10));
      expect(rect.y, equals(15));
      expect(rect.width, equals(100));
      expect(rect.height, equals(150));
    });
    test('should correctly compares with other rectangle', () {
      Rectangle rect1 = new Rectangle(10, 15, 100, 150);
      Rectangle rect2 = new Rectangle(10, 15, 100, 150);
      expect(rect1, equals(rect2));
      
      rect2.x = 20;
      
      expect(rect1 != rect2, equals(true));
    });
  });  
}