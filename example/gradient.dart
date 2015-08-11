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

  var filePath = 'example${Platform.pathSeparator}gradient.png';

  File file = new File(filePath);
  file.createSync();

  Surface surface = new ImageSurface(Format.ARGB32, 350, 350);
  Context ctx = new Context(surface);

  ctx.translate(10, 10);

  ctx.lineWidth = 2.0;

  var gradient = new LinearGradient(0.0, 0.0,  350.0, 350.0);

  double i;
  int count = 1;

  for (i = 0.05; i < 0.95; i += 0.055) {
    if (count % 2 == 0)  {
      gradient.addColorStop(new ColorStop(new Color.rgb(0, 0, 1), i));
    } else {
      gradient.addColorStop(new ColorStop(new Color.rgb(1, 1, 1), i));
    }
    count++;
  }

  ctx.rectangle(new Rectangle(0, 0, 350, 350));
  ctx.source = gradient;
  ctx.fill();

  // Save to png file
  surface.writeTo(filePath);
}