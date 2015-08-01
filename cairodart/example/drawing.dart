library cairodart.example;

import 'dart:io';

import 'package:cairodart/cairodart.dart';

main() {
  Directory dir = Directory.systemTemp.createTempSync('cairodart');

  var filePath = '${dir.path}${Platform.pathSeparator}star.png';

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