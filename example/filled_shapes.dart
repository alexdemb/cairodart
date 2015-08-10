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
import 'dart:math';

import 'package:cairodart/cairodart.dart';

main() {
  Directory dir = Directory.systemTemp.createTempSync('cairodart');

  var filePath = 'example${Platform.pathSeparator}filled_shapes.png';

  File file = new File(filePath);
  file.createSync();

  Surface surface = new ImageSurface(Format.ARGB32, 400, 200);
  Context ctx = new Context(surface);

  ctx.lineWidth = 1.0;

  // Red circle
  ctx..translate(150, 100)
     ..setSourceRgb(0, 0, 0)
     ..arc(0, 0, 50, 0, 2 * PI)
     ..strokePreserve()
     ..setSourceRgba(1, 0, 0, 0.7)
     ..fill();

  // Green circle
  ctx..translate(50, 0)
    ..setSourceRgb(0, 0, 0)
    ..arc(0, 0, 50, 0, 2 * PI)
    ..strokePreserve()
    ..setSourceRgba(0, 1, 0, 0.7)
    ..fill();

  // Blue circle
  ctx..translate(-25, 50)
    ..setSourceRgb(0, 0, 0)
    ..arc(0, 0, 50, 0, 2 * PI)
    ..strokePreserve()
    ..setSourceRgba(0, 0, 1, 0.7)
    ..fill();

  // Save to png file
  surface.writeTo(filePath);

}