library cairodart.example;

import 'dart:io';

import 'package:cairodart/cairodart.dart';

main() {
  Directory dir = Directory.systemTemp.createTempSync('cairodart');

  //var filePath = '${dir.path}${Platform.pathSeparator}captcha.png';
  var filePath = '/home/alexander/captcha.png';

  File file = new File(filePath);
  file.createSync();

  Surface surface = new ImageSurface(Format.ARGB32, 200, 100);
  Context ctx = new Context(surface);

  generateCaptcha(ctx, "Hello!");

  // Save to png file
  surface.writeTo(filePath);
}

void generateCaptcha(Context ctx, String text) {

  Matrix matrix = new Matrix(
      1.0, 0.2,
      0.0, 1.0,
      0.0, 0.0
  );
  ctx.transform(matrix);

  ctx
    ..selectFontFace('Arial', FontSlant.Italic, FontWeight.Bold)
    ..setFontSize(36);


  ctx.setSourceRgb(0, 0, 0);
  ctx..moveTo(20, 50)
     ..showText(text);

  ctx.setSourceRgb(0.5, 0.5, 0.5);

  ctx..moveTo(23, 53)
     ..showText(text);

}