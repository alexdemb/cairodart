part of cairodart.test;

runRegionTest() {
  group('Region', () {
    test('should be successfully created with default constructor', () {
      Region region = new Region();
      expect(region, isNotNull);
    });
    test('should be successfully created with "rectangle" constructor', () {
      Region region = new Region.rectangle(10, 15, 100, 150);
      expect(region, isNotNull);
    });
  });
}