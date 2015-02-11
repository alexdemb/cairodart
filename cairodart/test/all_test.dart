library cairodart.test;

import 'package:cairodart/cairodart.dart';
import 'package:unittest/unittest.dart';
import 'dart:core' hide Pattern;

part 'surface_test.dart';
part 'format_test.dart';
part 'point_test.dart';
part 'context_test.dart';
part 'pattern_test.dart';

main() {
  runFormatTests();
  runSurfaceTests();
  runPointTests();
  runContextTests();
  runPatternTests();
}
