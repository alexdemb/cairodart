part of cairodart.test;

runRegionTests() {
  group('Region', () {
    test('should be successfully created with default constructor', () {
      Region region = new Region();
      expect(region, isNotNull);
    });
    test('should be successfully created with "fromArea" constructor', () {
      Region region = new Region.fromArea(10, 15, 100, 150);
      expect(region, isNotNull);
    });
    test('should be successfully created with "fromRectangle" constructor', () {
      Rectangle rect = new Rectangle(10, 15, 100, 150);
      Region region = new Region.fromRectangle(rect);
      expect(region, isNotNull);
    });
    test('should be successfully created with "fromRectangles" constructor', () {
      Rectangle rect = new Rectangle(10, 15, 100, 150);
      Rectangle rect2 = new Rectangle(20, 25, 200, 250);
      
      Region region = new Region.fromRectangles([rect, rect2]);
      expect(region, isNotNull);
    });
    test('should be successfully copied from another region', () {
      Region region = new Region();
      Region copy = region.copy();
      expect(copy, isNotNull);
    });
    test('should correctly return extents', () {
      Rectangle ext = new Rectangle(10, 20, 100, 200);
      Region region = new Region.fromRectangle(ext);
      Rectangle res = region.getExtents();
      expect(res, equals(ext));
    });
    test('should correctly return number of rectangles for one rectangle', () {
      Rectangle ext = new Rectangle(10, 20, 100, 200);
      Region region = new Region.fromRectangle(ext);
      expect(region.countOfRectangles, equals(1));
    });
    test('should correctly return number of rectangles for 2 not intersected rectangles', () {
      Rectangle ext1 = new Rectangle(10, 20, 30, 40);
      Rectangle ext2 = new Rectangle(100, 200, 150, 250);
      Region region = new Region.fromRectangles([ext1, ext2]);
      expect(region.countOfRectangles, equals(2));
    });
    test('should correctly return number of rectangles for 2 intersected rectangles', () {
      Rectangle ext1 = new Rectangle(10, 20, 30, 40);
      Rectangle ext2 = new Rectangle(25, 35, 150, 250);
      Region region = new Region.fromRectangles([ext1, ext2]);
      expect(region.countOfRectangles, equals(3));
    });
    test('should correctly return rectangles', () {
      Rectangle ext1 = new Rectangle(10, 20, 30, 40);
      Rectangle ext2 = new Rectangle(100, 200, 150, 250);
      Region region = new Region.fromRectangles([ext1, ext2]);
      Rectangle res1 = region.rectangleAt(0);
      Rectangle res2 = region.rectangleAt(1);
      
      expect(res1, equals(ext1));
      expect(res2, equals(ext2));
    });
    test('should be empty if there is no rectangles', () {
      Region region = new Region();
      expect(region.isEmpty, isTrue);
    });
    test('should not be empty if there are rectangles', () {
      Rectangle rect = new Rectangle(10, 10, 100, 100);
      Region region = new Region.fromRectangle(rect);
      expect(region.isEmpty, isFalse);
    });
 });
}