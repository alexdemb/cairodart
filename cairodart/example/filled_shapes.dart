library cairodart.example;

import 'dart:io';
import 'dart:math';

import 'package:cairodart/cairodart.dart';

main() {
  Directory dir = Directory.systemTemp.createTempSync('cairodart');

  var filePath = '${dir.path}${Platform.pathSeparator}filled_shapes.png';

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