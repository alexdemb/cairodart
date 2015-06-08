part of cairodart.base;

abstract class Surface {
  
  void finish();
  void flush();
  void markDirty();
  void markDirtyRect(int x, int y, int width, int height);
  void copyPage();
  void showPage();
  bool supportsMimeType(String mimeType);
  
  Content get content;
  Point get deviceOffset;
  void set deviceOffset(Point offset);
  bool get hasShowTextGlyphs;
  SurfaceType get surfaceType;
  Resolution get fallbackResolution;
  void set fallbackResolution(Resolution resolution);
  
  operator==(Surface other);
}

abstract class _Surface extends NativeFieldWrapperClass2 implements Surface {
  
  void finish() native 'surface_finish';
  void flush() native 'surface_flush';
  Content get content {
    int c = _getContent();
    return new _Content(c);
  }
  
  SurfaceType get surfaceType {
    int type = _getSurfaceType();
    return new _SurfaceType(type);
  }
  
  void markDirty() native 'surface_mark_dirty';
  void markDirtyRect(int x, int y, int width, int height) native 'surface_mark_dirty_rectangle';
  
  int _getContent() native 'surface_get_content';
  int _getSurfaceType() native 'surface_get_type';
  
  Point get deviceOffset native 'surface_get_device_offset';
  void set deviceOffset(Point offset) {
    _deviceOffset(offset.x, offset.y);
  }
  
  void _deviceOffset(double x, double y) native 'surface_set_device_offset';
  
  void copyPage() native 'surface_copy_page';
  void showPage() native 'surface_show_page';
  bool get hasShowTextGlyphs native 'surface_has_show_text_glyphs';
  bool supportsMimeType(String mimeType) native 'surface_supports_mime_type';
  
  Resolution get fallbackResolution native 'surface_get_fallback_resolution';
  void set fallbackResolution(Resolution resolution) {
    _fallbackResolution(resolution.xResolution, resolution.yResolution);
  }
  
  void _fallbackResolution(double x, double y) native 'surface_set_fallback_resolution';
  
  operator==(Surface other) native 'surfaces_equals';
}

abstract class ImageSurface implements Surface {
  
  factory ImageSurface(Format format, int width, int height) => new _ImageSurface(format, width, height);
  
  
  factory ImageSurface.fromPng(String fileName) => new _ImageSurface.fromPng(fileName);
  
  int get width;
  int get height;
  int get stride;
  Format get format;
  
  void write();
  void writeTo(String fileName);
  
}


class _ImageSurface extends _Surface implements ImageSurface {
  
  Format _format;
  
  _ImageSurface(Format format, int width, int height) {
    _createImageSurface(format.value, width, height);
    _format = format;
  }
  
  _ImageSurface.internal(){}
  
  void _createImageSurface(int format, int width, int height) native 'image_surface_create';
  
  int get width native 'image_surface_get_width';
  int get height native 'image_surface_get_height';
  int get stride native 'image_surface_get_stride';
  Format get format => _format;
  
  String _fileName;
    
  _ImageSurface.fromPng(this._fileName) {
    _createPngSurface(_fileName);
  }
    
  void _createPngSurface(String fileName) native 'image_surface_create_from_png';
    
  void write() => writeTo(this._fileName);
    
  void writeTo(String fileName) native 'surface_write_to_png';
  
}

