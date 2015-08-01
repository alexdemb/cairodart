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