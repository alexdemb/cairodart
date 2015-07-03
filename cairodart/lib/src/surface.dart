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
  Device get device;

  operator==(Surface other);
}

abstract class PdfSurface implements Surface {

  factory PdfSurface(String fileName, num widthInPoints, num heightInPoints) =>
    new _PdfSurface(fileName, widthInPoints, heightInPoints);

  void setSize(num widthInPoints, num heightInPoints);

  void restrictToVersion(PdfVersion version);

  List<PdfVersion> get versions;

}

abstract class PostScriptSurface implements Surface {

  factory PostScriptSurface(String fileName, num widthInPoints, num heightInPoints) =>
    new _PostScriptSurface(fileName, widthInPoints, heightInPoints);

  bool encapsulated;

  void restrictToLevel(PostScriptLevel level);

  List<PostScriptLevel> get levels;

  void setSize(num width, num height);

  void beginPageSetup();

  void beginSetup();

  void dscComment(String comment);

}

abstract class SvgSurface {

  factory SvgSurface(String fileName, num widthInPoints, num heightInPoints) =>
    new _SvgSurface(fileName, widthInPoints, heightInPoints);

  void restrictToVersion(SvgVersion version);

  List<SvgVersion> get versions;

}

abstract class RecordingSurface implements Surface {

  factory RecordingSurface(Content content, List<Rectangle> extents) => new _RecordingSurface(content, extents);

  Rectangle get inkExtents;

  bool getExtents(List<Rectangle> extents);

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

  Device get device native 'surface_get_device';

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

abstract class ScriptSurface implements Surface {

  factory ScriptSurface(Device script, Content content, num width, num height) => new _ScriptSurface(script, content, width, height);
  factory ScriptSurface.forTarget(Device script, Surface target) => new _ScriptSurface(script, target);

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

class _PostScriptSurface extends _Surface implements PostScriptSurface {

  _PostScriptSurface(String fileName, num widthInPoints, num heightInPoints) {
    _createPostScriptSurface(fileName, widthInPoints.toDouble(), heightInPoints.toDouble());
  }

  void _createPostScriptSurface(String fileName, double width, double height) native 'ps_surface_create';

  bool get encapsulated native 'ps_surface_get_eps';
  void set encapsulated(bool value) native 'ps_surface_set_eps';

  void restrictToLevel(PostScriptLevel level) {
    _restrictToLevel(level.value);
  }

  void _restrictToLevel(int level) native 'ps_surface_restrict_to_level';

  List<PostScriptLevel> get levels native 'ps_get_levels';

  void setSize(num width, num height) {
    _setSize(width.toDouble(), height.toDouble());
  }

  void _setSize(double width, double height) native 'ps_surface_set_size';

  void beginPageSetup() native 'ps_surface_dsc_begin_page_setup';

  void beginSetup() native 'ps_surface_dsc_begin_setup';

  void dscComment(String comment) native 'ps_surface_dsc_comment';

}

class _SvgSurface extends _Surface implements SvgSurface {

  _SvgSurface(String fileName, num widthInPoints, num heightInPoints) {
    _createSvgSurface(fileName, widthInPoints.toDouble(), heightInPoints.toDouble());
  }

  void _createSvgSurface(String fileName, double width, double height) native 'svg_surface_create';

  void restrictToVersion(SvgVersion version) {
    _restrictToVersion(version.value);
  }

  void _restrictToVersion(int version) native 'svg_surface_restrict_to_version';

  List<SvgVersion> get versions native 'svg_get_versions';

}

class _RecordingSurface extends _Surface implements RecordingSurface {

  List<List<double>> extentsPoints(List<Rectangle> extents) => extents.map((r) => <double>[r.x.toDouble(), r.y.toDouble(), r.width.toDouble(), r.height.toDouble()]).toList();

  _RecordingSurface(Content content, List<Rectangle> extents) {
    if (extents != null) {
      _createRecordingSurface(content.value, extentsPoints(extents));
    } else {
      _createRecordingSurface(content.value, null);
    }
  }

  void _createRecordingSurface(int content, List<List<double>> rect) native 'recording_surface_create';

  Rectangle get inkExtents native 'recording_surface_ink_extents';

  bool getExtents(List<Rectangle> extents) => _getExtents(extentsPoints(extents));

  bool _getExtents(List<List<double>> rect) native 'recording_surface_get_extents';

}

class _ScriptSurface extends _Surface implements ScriptSurface {

  _ScriptSurface(Device script, Content content, num width, num height) {
    _createScriptSurface(script, content.value, width.toDouble(), height.toDouble());
  }

  _ScriptSurface.forTarget(Device script, Surface target) {
    _createScriptSurfaceForTarget(script, target);
  }

  void _createScriptSurface(Device script, int content, double width, double height) native 'script_surface_create';
  void _createScriptSurfaceForTarget(Device script, Surface target) native 'script_surface_create_for_target';

}