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

Matcher closeTo(double value, double epsilon) => new _CloseToMatcher(value, epsilon);


class _CloseToMatcher implements Matcher {
  
  double value;
  double epsilon;
  
  _CloseToMatcher(this.value, this.epsilon);
  
  bool matches(double item, Map matchState) {
    return item.compareTo(value - epsilon) >= 0 && item.compareTo(value + epsilon) <= 0; 
  }
    
  Description describe(Description description) => description.add('value close to $value with epsilon $epsilon');
 
  
  Description describeMismatch(double item, Description mismatchDescription, Map matchState, bool verbose) => mismatchDescription;
  
}



runUtilsTests() {
  group('closeTo matcher', () {
    test('should match values close to lower bound', () {
      double value1 = 1.99995;
      double value2 = 1.99997;
      
      expect(value1, closeTo(value2, 0.00003));
    });
    test('should match values close to upper bound', () {
      double value1 = 1.99999;
      double value2 = 1.99997;
          
      expect(value1, closeTo(value2, 0.00003));
    });
    test('should not match values not close to specified', () {
      double value1 = 2.5;
      double value2 = 1.99997;
              
      expect(value1, isNot(closeTo(value2, 0.00003)));
    });    
  });
}