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

  var filePath = 'example/${Platform.pathSeparator}transparency.png';

  File file = new File(filePath);
  file.createSync();

  Surface surface = new ImageSurface(Format.ARGB32, 350, 350);
  Context ctx = new Context(surface);

  ctx.translate(10, 175);

  for (int i = 0; i < 10; i++) {
    ctx.translate(25, 0);
    var rect = new Rectangle(0, -10, 20, 20);
    ctx.rectangle(rect);
    ctx.setSourceRgba(0, 1, 0, 0.1 * i);
    ctx.fill();
  }

  // Save to png file
  surface.writeTo(filePath);
}