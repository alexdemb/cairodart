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

library cairodart.example;

import 'dart:io';

import 'package:cairodart/cairodart.dart';

main() {

  var filePath = 'example${Platform.pathSeparator}star.png';

  File file = new File(filePath);
  file.createSync();

  Surface surface = new ImageSurface(Format.ARGB32, 200, 200);
  Context ctx = new Context(surface);

  // Draw red star using 5 pixel lines and round caps
  ctx
    ..setSourceRgb(1, 0, 0)
    ..lineWidth = 5.0
    ..lineCap = LineCap.Round
    ..moveTo(100, 10)
    ..lineTo(130, 80)
    ..lineTo(60, 40)
    ..lineTo(140, 40)
    ..lineTo(70, 80)
    ..lineTo(100, 10)
    ..stroke();

  // Save to png file
  surface.writeTo(filePath);

}