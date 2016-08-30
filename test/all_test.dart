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

library cairodart.test;

import 'package:cairodart/cairodart.dart';
import 'package:test/test.dart';
import 'dart:core' hide Pattern;
import 'dart:typed_data';

part 'surface_test.dart';
part 'format_test.dart';
part 'point_test.dart';
part 'context_test.dart';
part 'pattern_test.dart';
part 'matrix_test.dart';
part 'region_test.dart';
part 'rectangle_test.dart';
part 'test_utils.dart';
part 'font_options_test.dart';
part 'device_test.dart';
part 'font_face_test.dart';

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
  runFontOptionsTests();
  runDeviceTests();
  runFontFaceTests();
}
