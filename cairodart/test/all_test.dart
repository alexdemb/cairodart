library cairodart.test;

import 'package:cairodart/cairodart.dart';
import 'package:unittest/unittest.dart';
import 'dart:core' hide Pattern;

part 'surface_test.dart';
part 'format_test.dart';
part 'point_test.dart';
part 'context_test.dart';
part 'pattern_test.dart';
part 'matrix_test.dart';
part 'region_test.dart';
part 'rectangle_test.dart';
part 'test_utils.dart';

main() {
  runUtilsTests();
  runFormatTests();
  runSurfaceTests();
  runPointTests();
  runContextTests();
  runPatternTests();
  runMatrixTests();
  runRegionTests();
  runRectangleTests();
}
