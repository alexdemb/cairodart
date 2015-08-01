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