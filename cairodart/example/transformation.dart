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
  Directory dir = Directory.systemTemp.createTempSync('cairodart');

  var filePath = '${dir.path}${Platform.pathSeparator}transformation.png';

  File file = new File(filePath);
  file.createSync();

  Surface surface = new ImageSurface(Format.ARGB32, 350, 350);
  Context ctx = new Context(surface);

  ctx..translate(10, 10)
     ..setSourceRgb(1, 1, 0)
     ..rectangleByCoords(0, 0, 50, 50)
     ..fill();

  Matrix matrix = new Matrix(
      1.0, 0.5,
      0.0, 1.0,
      0.0, 0.0
  );

  ctx..translate(100, 0);
  ctx.transform(matrix);

  ctx..setSourceRgb(1, 0, 1)
     ..rectangleByCoords(0, 0, 50, 50)
     ..fill();

  // Save to png file
  surface.writeTo(filePath);
}