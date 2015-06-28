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
  void writeTo(String fileName);

  operator==(Surface other);
}

abstract class PdfSurface implements Surface {

  factory PdfSurface(String fileName, num widthInPoints, num heightInPoints) =>
    new _PdfSurface(fileName, widthInPoints, heightInPoints);

  void setSize(num widthInPoints, num heightInPoints);

  void restrictToVersion(PdfVersion version);

  List<PdfVersion> get versions;

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

  void writeTo(String fileName) native 'surface_write_to_png';

  operator==(Surface other) native 'surfaces_equals';
}

abstract class ImageSurface implements Surface {
  
  factory ImageSurface(Format format, int width, int height) => new _ImageSurface(format, width, height);
  factory ImageSurface.forData(List<int> data, Format format, int width, int height, int stride) =>
    new _ImageSurface.forData(data, format, width, height, stride);
  
  factory ImageSurface.fromPng(String fileName) => new _ImageSurface.fromPng(fileName);
  
  int get width;
  int get height;
  int get stride;
  Format get format;
  List<int> get data;

  void write();

  
}


class _ImageSurface extends _Surface implements ImageSurface {
  
  Format _format;
  
  _ImageSurface(Format format, int width, int height) {
    _createImageSurface(format.value, width, height);
    _format = format;
  }

  _ImageSurface.forData(List<int> data, Format format, int width, int height, int stride) {
    _createImageSurfaceForData(data, format.value, width, height, stride);
  }
  
  _ImageSurface.internal(){}

  void _createImageSurfaceForData(List<int> data, int format, int width, int height, int stride) native 'image_surface_create_for_data';

  void _createImageSurface(int format, int width, int height) native 'image_surface_create';
  
  int get width native 'image_surface_get_width';
  int get height native 'image_surface_get_height';
  int get stride native 'image_surface_get_stride';
  Format get format => _format;
  List<int> get data native 'image_surface_get_data';
  
  String _fileName;
    
  _ImageSurface.fromPng(this._fileName) {
    _createPngSurface(_fileName);
  }
    
  void _createPngSurface(String fileName) native 'image_surface_create_from_png';
    
  void write() => writeTo(this._fileName);
    

}

class _PdfSurface extends _Surface implements PdfSurface {

  _PdfSurface(String fileName, num widthInPoints, num heightInPoints) {
    _createPdfSurface(fileName, widthInPoints.toDouble(), heightInPoints.toDouble());
  }

  void _createPdfSurface(String fileName, double widthInPoints, double heightInPoints) native 'pdf_surface_create';

  void setSize(num widthInPoints, num heightInPoints) {
    _setSize(widthInPoints.toDouble(), heightInPoints.toDouble());
  }

  void _setSize(double width, double height) native 'pdf_surface_set_size';

  void restrictToVersion(PdfVersion version) {
    _restrictToVersion(version.value);
  }

  void _restrictToVersion(int version) native 'pdf_surface_restrict_to_version';

  List<PdfVersion> get versions native 'pdf_surface_get_versions';

}