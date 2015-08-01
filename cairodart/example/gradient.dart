library cairodart.example;

import 'dart:io';

import 'package:cairodart/cairodart.dart';

main() {
  Directory dir = Directory.systemTemp.createTempSync('cairodart');

  var filePath = '${dir.path}${Platform.pathSeparator}gradient.png';

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