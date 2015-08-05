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

part of cairodart.base;

///
/// Used to describe the type of a given surface.
/// The surface types are also known as "backends" or "surface backends" within cairo.
///
/// The type of a surface is determined by the class used to create it.
///
/// The surface type can be queried with [type] property.
///
/// The various [Surface] methods can be used with surfaces of any type,
/// but some backends also provide type-specific methods that must only be called with a surface of the
/// appropriate type.
///
/// The behavior of calling a type-specific method with a surface of the wrong type is undefined.
///
/// New entries may be added in future versions.
///
abstract class SurfaceType {

  /// The surface is of type image
  static final SurfaceType Image = new _SurfaceType(0);

  /// The surface is of type pdf
  static final SurfaceType PDF = new _SurfaceType(1);

  /// The surface is of type ps
  static final SurfaceType PS = new _SurfaceType(2);

  /// The surface is of type xlib
  static final SurfaceType XLib = new _SurfaceType(3);

  /// The surface is of type xcb
  static final SurfaceType XCB = new _SurfaceType(4);

  /// The surface is of type glitz
  static final SurfaceType Glitz = new _SurfaceType(5);

  /// The surface is of type quartz
  static final SurfaceType Quartz = new _SurfaceType(6);

  /// The surface is of type win32
  static final SurfaceType Win32 = new _SurfaceType(7);

  /// The surface is of type beos
  static final SurfaceType BeOS = new _SurfaceType(8);

  /// The surface is of type directfb
  static final SurfaceType DirectFB = new _SurfaceType(9);

  /// The surface is of type svg
  static final SurfaceType SVG = new _SurfaceType(10);

  /// The surface is of type os2
  static final SurfaceType OS2 = new _SurfaceType(11);

  /// The surface is a win32 printing surface
  static final SurfaceType Printing = new _SurfaceType(12);

  /// The surface is of type quartz_image, since
  static final SurfaceType QuartzImage = new _SurfaceType(13);

  /// The surface is of type script
  static final SurfaceType Script = new _SurfaceType(14);

  /// The surface is of type Qt
  static final SurfaceType Qt = new _SurfaceType(15);

  /// The surface is of type recording
  static final SurfaceType Recording = new _SurfaceType(16);

  /// The surface is a OpenVG surface
  static final SurfaceType VG = new _SurfaceType(17);

  /// The surface is of type OpenGL
  static final SurfaceType GL = new _SurfaceType(18);

  /// The surface is of type Direct Render Manager
  static final SurfaceType DRM = new _SurfaceType(19);

  /// The surface is of type 'tee' (a multiplexing surface)
  static final SurfaceType TEE = new _SurfaceType(20);

  /// The surface is of type XML (for debugging)
  static final SurfaceType XML = new _SurfaceType(21);

  /// The surface is of type Skia
  static final SurfaceType SKIA = new _SurfaceType(22);

  /// The surface is a subsurface created with [createForRectangle].
  static final SurfaceType Subsurface = new _SurfaceType(23);

  /// This surface is of type Cogl
  static final SurfaceType COGL = new _SurfaceType(24);
 
  int get value;
}

class _SurfaceType extends NativeFieldWrapperClass2 implements SurfaceType {
  
  int _val;
  
  _SurfaceType(this._val);
  
  int get value => _val;
  
  @override
  operator==(SurfaceType other) => value == other.value;
}