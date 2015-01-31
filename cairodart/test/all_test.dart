library cairodart.test;

import 'package:cairodart/cairodart.dart';
import 'package:unittest/unittest.dart';

part 'surface_test.dart';
part 'format_test.dart';

main() {
  runFormatTests();
  runSurfaceTests();
}
