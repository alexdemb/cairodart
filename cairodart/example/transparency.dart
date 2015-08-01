library cairodart.example;

import 'dart:io';

import 'package:cairodart/cairodart.dart';

main() {
  Directory dir = Directory.systemTemp.createTempSync('cairodart');

  var filePath = '${dir.path}${Platform.pathSeparator}transparency.png';

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