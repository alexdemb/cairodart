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

import 'package:cairodart/cairodart.dart';
import 'dart:io';

main() {

  print("Please enter your name: ");

  var name = stdin.readLineSync();

  var path = "example${Platform.pathSeparator}pdf_render.pdf";

  File file = new File(path);
  file.createSync();

  var surface = new PdfSurface(path, 640, 480);
  var ctx = new Context(surface);

  var gradient = new LinearGradient(0, 0, 640, 480);

  gradient..addColorStop(new ColorStop(new Color.rgb(0.5, 0.5, 0.5), 0))
          ..addColorStop(new ColorStop(new Color.rgb(0.8, 0.8, 0.8), 0.8));

  ctx..source = gradient
     ..rectangleByCoords(0, 0, 640, 480)
     ..fill(); // Gradient background


  ctx..selectFontFace('Arial', FontSlant.Normal, FontWeight.Bold)
     ..setFontSize(36)
     ..setSourceRgb(0, 0, 0)
     ..moveTo(54, 204)
     ..showText('Hello, $name!') // Shadow effect
     ..setSourceRgb(1, 1, 1)
     ..moveTo(50, 200)
     ..showText('Hello, $name!');

  surface.finish();

  print("Please see output in file ${file.absolute.path}");

}