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
  });
}