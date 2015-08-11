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

  var filePath = 'example${Platform.pathSeparator}captcha.png';

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

  String firstPart = text.substring(0, 3);
  String secondPart = text.substring(3);

  ctx
    ..selectFontFace('Arial', FontSlant.Italic, FontWeight.Bold)
    ..setFontSize(36);


  ctx.setSourceRgb(1, 0, 0);
  ctx..moveTo(20, 50)
     ..showText(firstPart);

  matrix.rotate(-PI / 4);
  ctx.transform(matrix);

  ctx..moveTo(40, 80)
     ..showText(secondPart);

}

