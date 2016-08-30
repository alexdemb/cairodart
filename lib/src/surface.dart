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
/// Base class for surfaces.
///
abstract class Surface implements RefObject {


  ///
  /// This function finishes the surface and drops all references to external resources.
  ///
  /// After calling [finish()] the only valid operations on a surface are destroying, flushing and finishing it.
  ///
  /// Further drawing to the surface will not affect the surface but will instead
  /// trigger a [CairoStatus.SurfaceFinished] error.
  ///
  void finish();

  ///
  /// Do any pending drawing for the surface and also restore any temporary modifications cairo
  /// has made to the surface's state.
  ///
  /// This function must be called before switching from drawing on the surface with cairo to drawing on
  /// it directly with native APIs.
  /// If the surface doesn't support direct access, then this function does nothing.
  ///
  void flush();

  ///
  /// Tells cairo that drawing has been done to surface using means other than cairo,
  /// and that cairo should reread any cached areas.
  ///
  /// Note that you must call [flush()] before doing such drawing.
  ///
  void markDirty();

  ///
  /// Like [markDirty()], but drawing has been done only to the specified rectangle,
  /// so that cairo can retain cached contents for other parts of the surface.
  ///
  /// Any cached clip set on the surface will be reset by this method,
  /// to make sure that future cairo calls have the clip set that they expect.
  ///
  void markDirtyRect(int x, int y, int width, int height);

  ///
  /// Emits the current page for backends that support multiple pages, but doesn't clear it,
  /// so that the contents of the current page will be retained for the next page.
  ///
  /// Use [showPage()] if you want to get an empty page after the emission.
  ///
  void copyPage();

  ///
  /// Emits and clears the current page for backends that support multiple pages.
  ///
  /// Use [copyPage()] if you don't want to clear the page.
  ///
  void showPage();

  ///
  /// Return whether surface supports [mimeType].
  ///
  bool supportsMimeType(String mimeType);

  ///
  /// Gets the content type of surface which indicates whether the surface contains color and/or alpha information.
  ///
  Content get content;

  ///
  /// Gets or sets the device offset.
  ///
  Point deviceOffset;

  bool get hasShowTextGlyphs;

  ///
  /// Gets the type of the backend used to create a surface.
  ///
  SurfaceType get surfaceType;

  ///
  /// Gets or sets the fallback resolution.
  ///
  Resolution fallbackResolution;


  ///
  /// Writes the contents of surface to a new file filename as a PNG image.
  ///
  void writeTo(String fileName);

  ///
  /// Gets the device for a surface.
  ///
  Device get device;

  operator==(Surface other);
}

///
/// Rendering PDF documents.
///
abstract class PdfSurface implements Surface {

  ///
  /// Creates a PDF surface of the specified size in points to be written to filename.
  ///
  factory PdfSurface(String fileName, num widthInPoints, num heightInPoints) =>
    new _PdfSurface(fileName, widthInPoints, heightInPoints);

  ///
  /// Changes the size of a PDF surface for the current (and subsequent) pages.
  ///
  /// This method should only be called before any drawing operations have been performed on the current page.
  /// The simplest way to do this is to call this method immediately after creating the surface or immediately
  /// after completing a page with either [showPage()] or [copyPage()].
  ///
  void setSize(num widthInPoints, num heightInPoints);

  ///
  /// Restricts the generated PDF file to version.
  ///
  /// See [versions] for a list of available version values that can be used here.
  /// This method should only be called before any drawing operations have been performed on the given surface.
  /// The simplest way to do this is to call this method immediately after creating the surface.
  ///
  void restrictToVersion(PdfVersion version);

  ///
  /// Used to retrieve the list of supported versions.
  ///
  List<PdfVersion> get versions;

}

///
/// Rendering PostScript documents.
///
abstract class PostScriptSurface implements Surface {

  ///
  /// Creates a PostScript surface of the specified size in points to be written to filename.
  ///
  factory PostScriptSurface(String fileName, num widthInPoints, num heightInPoints) =>
    new _PostScriptSurface(fileName, widthInPoints, heightInPoints);

  ///
  /// Gets or sets whether the PostScript surface will output Encapsulated PostScript.
  ///
  bool encapsulated;


  ///
  /// Restricts the generated PostSript file to level .
  ///
  /// See [levels] for a list of available level values that can be used here.
  ///
  /// This method should only be called before any drawing operations have been performed on the given surface.
  /// The simplest way to do this is to call this method immediately after creating the surface.
  ///
  void restrictToLevel(PostScriptLevel level);

  ///
  /// Used to retrieve the list of supported levels.
  ///
  List<PostScriptLevel> get levels;

  ///
  /// Changes the size of a PostScript surface for the current (and subsequent) pages.
  ///
  /// This method should only be called before any drawing operations have been performed on the current page.
  /// The simplest way to do this is to call this method immediately after creating the surface or immediately
  /// after completing a page with either [showPage()] or [copyPage()].
  ///
  void setSize(num width, num height);

  ///
  /// This method indicates that subsequent calls to [dscComment()] should direct comments to the PageSetup
  /// section of the PostScript output.
  ///
  /// This method call is only needed for the first page of a surface.
  /// It should be called after any call to [beginSetup()] and before any drawing is performed to the surface.
  ///
  void beginPageSetup();

  ///
  /// This method indicates that subsequent calls to [dscComment()] should direct comments to the Setup section
  /// of the PostScript output.
  ///
  /// This method should be called at most once per surface, and must be called before any call to
  /// [beginPageSetup()] and before any drawing is performed to the surface.
  ///
  void beginSetup();

  ///
  /// Emit a comment into the PostScript output for the given surface.
  ///
  /// The comment is expected to conform to the PostScript Language Document Structuring Conventions (DSC).
  /// Please see that manual for details on the available comments and their meanings.
  ///
  /// In particular, the %%IncludeFeature comment allows a device-independent means of controlling printer device
  /// features. So the PostScript Printer Description Files Specification will also be a useful reference.
  ///
  /// The comment string must begin with a percent character (%) and the total length of the string
  /// (including any initial percent characters) must not exceed 255 characters.
  /// Violating either of these conditions will place surface into an error state. But beyond these two conditions,
  /// this method will not enforce conformance of the comment with any particular specification.
  ///
  /// The comment string should not have a trailing newline.
  ///
  /// The DSC specifies different sections in which particular comments can appear.
  /// This method provides for comments to be emitted within three sections: the header, the Setup section,
  /// and the PageSetup section. Comments appearing in the first two sections apply to the entire document while
  /// comments in the BeginPageSetup section apply only to a single page.
  ///
  /// For comments to appear in the header section, this method should be called after the surface is created,
  /// but before a call to [beginSetup()].
  ///
  /// For comments to appear in the Setup section, this method should be called after a call to [beginSetup()]
  /// but before a call to [beginPageSetup()].
  ///
  /// For comments to appear in the PageSetup section, this function should be called after
  /// a call to [beginPageSetup()].
  ///
  /// Note that it is only necessary to call [beginPageSetup()] for the first page of any surface.
  /// After a call to [Surfafce.showPage()] or [Surface.copyPage()] comments are unambiguously directed to the
  /// PageSetup section of the current page.
  /// But it doesn't hurt to call this function at the beginning of every page as that consistency may make the
  /// calling code simpler.
  ///
  /// As a final note, cairo automatically generates several comments on its own. As such,
  /// applications must not manually generate any of the following comments:
  ///
  /// Header section: %!PS-Adobe-3.0, %%Creator, %%CreationDate, %%Pages, %%BoundingBox, %%DocumentData,
  /// %%LanguageLevel, %%EndComments.
  ///
  /// Setup section: %%BeginSetup, %%EndSetup
  ///
  /// PageSetup section: %%BeginPageSetup, %%PageBoundingBox, %%EndPageSetup.
  ///
  /// Other sections: %%BeginProlog, %%EndProlog, %%Page, %%Trailer, %%EOF
  ///
  void dscComment(String comment);

}

///
/// Rendering SVG documents.
///
abstract class SvgSurface {

  ///
  /// Creates a SVG surface of the specified size in points to be written to filename.
  ///
  /// The SVG surface backend recognizes the following MIME types for the data attached to a surface
  /// when it is used as a source pattern for drawing on this surface: JPEG, PNG, URI.
  ///
  /// If any of them is specified, the SVG backend emits a href with the content of MIME data instead of a
  /// surface snapshot (PNG, Base64-encoded) in the corresponding image tag.
  ///
  /// The unofficial MIME type URI is examined first.
  /// If present, the URI is emitted as is: assuring the correctness of URI is left to the client code.
  ///
  /// If URI is not present, but JPEG or PNG is specified, the corresponding data is Base64-encoded and emitted.
  ///
  factory SvgSurface(String fileName, num widthInPoints, num heightInPoints) =>
    new _SvgSurface(fileName, widthInPoints, heightInPoints);

  ///
  /// Restricts the generated SVG file to version.
  ///
  /// See [versions] for a list of available version values that can be used here.
  /// This function should only be called before any drawing operations have been performed on the given surface.
  /// The simplest way to do this is to call this function immediately after creating the surface.
  ///
  void restrictToVersion(SvgVersion version);

  ///
  /// Used to retrieve the list of supported versions.
  ///
  List<SvgVersion> get versions;

}

///
/// Records all drawing operations.
///
abstract class RecordingSurface implements Surface {

  ///
  /// Creates a recording-surface which can be used to record all drawing operations at the highest level
  /// (that is, the level of paint, mask, stroke and fill).
  ///
  /// The recording surface can then be "replayed" against any target surface by
  /// using it as a source to drawing operations.
  ///
  /// The recording phase of the recording surface is careful to snapshot all necessary objects
  /// (paths, patterns, etc.),
  /// in order to achieve accurate replay.
  ///
  factory RecordingSurface(Content content, List<Rectangle> extents) => new _RecordingSurface(content, extents);

  ///
  /// Measures the extents of the operations stored within the recording-surface.
  ///
  /// This is useful to compute the required size of an image surface (or equivalent) into which to replay the
  /// full sequence of drawing operations.
  ///
  Rectangle get inkExtents;

  ///
  /// Get the extents of the recording-surface.
  ///
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

  CairoStatus get status native 'surface_status';

  operator==(Surface other) native 'surfaces_equals';
}

abstract class ImageSurface implements Surface {

  factory ImageSurface(Format format, int width, int height) => new _ImageSurface(format, width, height);
  factory ImageSurface.forData(Uint8List data, Format format, int width, int height, int stride) =>
    new _ImageSurface.forData(data, format, width, height, stride);

  factory ImageSurface.fromPng(String fileName) => new _ImageSurface.fromPng(fileName);

  int get width;
  int get height;
  int get stride;
  Format get format;
  Uint8List get data;

  void write();


}

abstract class ScriptSurface implements Surface {

  factory ScriptSurface(Device script, Content content, num width, num height) => new _ScriptSurface(script, content, width, height);
  factory ScriptSurface.forTarget(Device script, Surface target) => new _ScriptSurface.forTarget(script, target);

}

class _ImageSurface extends _Surface implements ImageSurface {

  Format _format;

  _ImageSurface(Format format, int width, int height) {
    _createImageSurface(format.value, width, height);
    _format = format;
  }

  _ImageSurface.forData(Uint8List data, Format format, int width, int height, int stride) {
    _createImageSurfaceForData(data, format.value, width, height, stride);
  }

  _ImageSurface.internal(){}

  void _createImageSurfaceForData(Uint8List data, int format, int width, int height, int stride) native 'image_surface_create_for_data';

  void _createImageSurface(int format, int width, int height) native 'image_surface_create';

  int get width native 'image_surface_get_width';
  int get height native 'image_surface_get_height';
  int get stride native 'image_surface_get_stride';
  Format get format => _format;
  Uint8List get data native 'image_surface_get_data';

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

  _PdfSurface.internal(){}

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

  _PostScriptSurface.internal(){}

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

  _SvgSurface.internal(){}

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
