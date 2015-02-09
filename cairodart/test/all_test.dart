library cairodart.test;

import 'package:cairodart/cairodart.dart';
import 'package:unittest/unittest.dart';

part 'surface_test.dart';
part 'format_test.dart';
part 'point_test.dart';
part 'context_test.dart';

main() {
  runFormatTests();
  runSurfaceTests();
  runPointTests();
  runContextTests();
}
