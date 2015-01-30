part of cairodart.base;

abstract class Surface {
  
}

abstract class ImageSurface implements Surface {
  
  factory ImageSurface(Format format, int width, int height) {
    return new _ImageSurface(format, width, height);
  }
  
  int get width;
  int get height;
  
}


class _ImageSurface extends NativeFieldWrapperClass2 implements ImageSurface {
  
  _ImageSurface(Format format, int width, int height) {
    _createImageSurface(format, width, height);
  }
  
  void _createImageSurface(Format format, int width, int height) native 'image_surface_create';
  
  int get width native 'image_surface_get_width';
  int get height native 'image_surface_get_height';
  
}