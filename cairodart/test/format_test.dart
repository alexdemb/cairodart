part of cairodart.test;

runFormatTests() {
  group('Format', () {
    test('should have corect stride for width', () {
      int stride = Format.ARGB32.strideForWidth(640);
      expect(stride, equals(2560));
    });
    test('should have -1 stride for very big width', () {
      int stride = Format.ARGB32.strideForWidth(99999999);
      expect(stride, equals(-1));
    });
  });
}