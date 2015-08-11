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
/// Sources for drawing.
///
abstract class Pattern implements RefObject {

  ///
  /// Gets or sets the current extend mode for a pattern.
  ///
  Extend extend;

  ///
  /// Gets the type of pattern.
  ///
  PatternType get patternType;

  ///
  /// Gets or sets the pattern's transformation matrix to matrix .
  ///
  /// This matrix is a transformation from user space to pattern space.
  /// When a pattern is first created it always has the identity matrix for its transformation matrix,
  /// which means that pattern space is initially identical to user space.
  ///
  /// Important: Please note that the direction of this transformation matrix is from user space to pattern space.
  /// This means that if you imagine the flow from a pattern to user space (and on to device space),
  /// then coordinates in that flow will be transformed by the inverse of the pattern matrix.
  ///
  Matrix matrix;

  
  operator==(Pattern pattern);
}

///
/// A solid (uniform color) pattern.
///
/// It may be opaque or translucent.
///
abstract class SolidPattern implements Pattern {

  ///
  /// Creates a new [SolidPattern] corresponding to an opaque color.
  ///
  /// The color components are floating point numbers in the range 0 to 1.
  /// If the values passed in are outside that range, they will be clamped.
  ///
  factory SolidPattern.fromRgb(num red, num green, num blue) =>
    new _SolidPattern.fromRgb(red.toDouble(), green.toDouble(), blue.toDouble());

  ///
  /// Creates a new [SolidPattern] corresponding to a translucent color.
  ///
  /// The color components are floating point numbers in the range 0 to 1.
  /// If the values passed in are outside that range, they will be clamped.
  ///
  factory SolidPattern.fromRgba(num red, num green, num blue, num alpha) =>
    new _SolidPattern.fromRgba(red.toDouble(), green.toDouble(), blue.toDouble(), alpha.toDouble());

  ///
  /// Creates a new [SolidPattern] using specified color.
  ///
  /// This method is equivalent to [fromRgb] constructor in case when solid == true and
  /// to [fromRgba] constructor in case when solid == false.
  ///
  factory SolidPattern.fromColor(Color color, [bool solid = false]) =>
    new _SolidPattern.fromColor(color, solid);


  /// Gets the solid color for a solid color pattern.
  Color get color;

}

///
/// A gradient pattern.
///
abstract class Gradient implements Pattern {

  ///
  /// Adds a translucent color stop to a gradient pattern.
  /// The offset specifies the location along the gradient's control vector.
  /// For example, a linear gradient's control vector is from (x0, y0) to (x1, y1) while a radial gradient's control
  /// vector is from any point on the start circle to the corresponding point on the end circle.
  ///
  /// The color is specified in the same way as in [Context.setSourceRgba()].
  /// If two (or more) stops are specified with identical offset values, they will be sorted according to the
  /// order in which the stops are added,
  /// (stops added earlier will compare less than stops added later).
  ///
  /// This can be useful for reliably making sharp color transitions instead of the typical blend.
  ///
  /// Note: If the pattern is not a gradient pattern, (eg. a linear or radial pattern),
  /// then the pattern will be put into an error status with a status of [CairoStatus.PatternTypeMismatch].
  ///
  void addColorStop(ColorStop stop);

  ///
  /// Gets the color and offset information at the given index for a gradient pattern.
  ///
  ColorStop colorStopAt(int index);

  /// Gets the number of color stops specified in the given gradient pattern.
  int get colorStopCount;
}

///
/// A linear gradient pattern.
///
abstract class LinearGradient implements Gradient {

  ///
  /// Create a new linear gradient pattern along the line defined by (x0, y0) and (x1, y1).
  ///
  /// Before using the gradient pattern, a number of color stops should be defined using [Gradient.addColorStop()].
  ///
  /// Note: The coordinates here are in pattern space. For a new pattern, pattern space is identical to user space,
  /// but the relationship between the spaces can be changed with [Pattern.matrix].
  ///
  factory LinearGradient(num x0, num y0, num x1, num y1) => new _LinearGradient(x0.toDouble(), y0.toDouble(), x1.toDouble(), y1.toDouble());

  /// Gets the gradient endpoints for a linear gradient
  List<Point> get linearPoints;
}

///
/// A radial gradient pattern.
///
abstract class RadialGradient implements Gradient {

  ///
  /// Creates a new radial gradient pattern between the two circles defined by (cx0, cy0, radius0) and
  /// (cx1, cy1, radius1).
  ///
  /// Before using the gradient pattern, a number of color stops should be defined using [Gradient.addColorStop()].
  ///
  /// Note: The coordinates here are in pattern space. For a new pattern, pattern space is identical to user space,
  /// but the relationship between the spaces can be changed with [Pattern.matrix].
  ///
  factory RadialGradient(num cx0, num cy0, num radius0, num cx1, num cy1, num radius1) =>
          new _RadialGradient(cx0.toDouble(),
                        cy0.toDouble(),
                        radius0.toDouble(),
                        cx1.toDouble(),
                        cy1.toDouble(),
                        radius1.toDouble());

  List<Circle> get radialCircles;
}

///
/// A surface pattern.
///
abstract class SurfacePattern implements Pattern {

  /// Gets the current filter for a pattern
  Filter filter;

  ///
  /// Create a new [SurfacePattern] for the given surface.
  ///
  factory SurfacePattern(Surface surface) => new _SurfacePattern(surface);
}

///
/// A mesh pattern.
///
abstract class MeshPattern implements Pattern {

  ///
  /// Create a new mesh pattern.
  ///
  /// Mesh patterns are tensor-product patch meshes (type 7 shadings in PDF).
  /// Mesh patterns may also be used to create other types of shadings that are special cases of tensor-product
  /// patch meshes such as Coons patch meshes (type 6 shading in PDF) and Gouraud-shaded triangle meshes
  /// (type 4 and 5 shadings in PDF).
  ///
  /// Mesh patterns consist of one or more tensor-product patches, which should be defined before using the mesh
  /// pattern.
  /// Using a mesh pattern with a partially defined patch as source or mask will put the context in an error status
  /// with a status of [CairoStatus.InvalidMeshConstruction].
  /// A tensor-product patch is defined by 4 Bézier curves (side 0, 1, 2, 3) and by 4 additional control points
  /// (P0, P1, P2, P3) that provide further control over the patch and complete the definition of the
  /// tensor-product patch.
  /// The corner C0 is the first point of the patch.
  /// Degenerate sides are permitted so straight lines may be used.
  /// A zero length line on one side may be used to create 3 sided patches.
  ///
  /// Each patch is constructed by first calling [beginPatch()], then [moveTo()] to specify the first point in the
  /// patch (C0). Then the sides are specified with calls to [curveTo()] and [lineTo()].
  /// The four additional control points (P0, P1, P2, P3) in a patch can be specified with
  /// [setControlPoint()].
  ///
  /// At each corner of the patch (C0, C1, C2, C3) a color may be specified with [setCornerColor()].
  /// Any corner whose color is not explicitly specified defaults to transparent black.
  /// A Coons patch is a special case of the tensor-product patch where the control points are implicitly
  /// defined by the sides of the patch. The default value for any control point not specified is the implicit
  /// value for a Coons patch, i.e. if no control points are specified the patch is a Coons patch.
  ///
  /// A triangle is a special case of the tensor-product patch where the control points are implicitly defined by
  /// the sides of the patch, all the sides are lines and one of them has length 0, i.e. if the patch is
  /// specified using just 3 lines, it is a triangle. If the corners connected by the 0-length side have the same
  /// color, the patch is a Gouraud-shaded triangle.
  ///
  /// Patches may be oriented differently to the above diagram. For example the first point could be at the top left.
  /// The diagram only shows the relationship between the sides, corners and control points. Regardless of where
  /// the first point is located, when specifying colors, corner 0 will always be the first point,
  /// corner 1 the point between side 0 and side 1 etc.
  /// Calling [endPatch]() completes the current patch.
  /// If less than 4 sides have been defined, the first missing side is defined as a line from the current
  /// point to the first point of the patch (C0) and the other sides are degenerate lines from C0 to C0.
  /// The corners between the added sides will all be coincident with C0 of the patch and their color will be set
  /// to be the same as the color of C0.
  ///
  factory MeshPattern() => new _MeshPattern();

  ///
  /// Begin a patch in a mesh pattern.
  ///
  /// After calling this function, the patch shape should be defined with [moveTo()], [lineTo()] and [curveTo()].
  ///
  /// After defining the patch, [endPatch()] must be called before using pattern as a source or mask.
  ///
  /// Note: If pattern is not a mesh pattern then pattern will be put into an error status with a status of
  /// [CairoStatus.PatternTypeMismatch].
  ///
  /// If pattern already has a current patch, it will be put into an error status with
  /// a status of [CairoStatus.InvalidMeshConstruction].
  ///
  void beginPatch();

  ///
  /// Indicates the end of the current patch in a mesh pattern.
  ///
  /// If the current patch has less than 4 sides, it is closed with a straight line from the current point to the
  /// first point of the patch as if [lineTo()] was used.
  ///
  /// Note: If pattern is not a mesh pattern then pattern will be put into an error status with a status of
  /// [CairoStatus.PatternTypeMismatch].
  ///
  /// If pattern has no current patch or the current patch has no current point, pattern will be put into an
  /// error status with a status of [CairoStatus.InvalidMeshConstruction].
  ///
  void endPatch();

  ///
  /// Define the first point of the current patch in a mesh pattern.
  ///
  /// After this call the current point will be (x , y).
  ///
  /// Note: If pattern is not a mesh pattern then pattern will be put into an error status with a
  /// status of [CairoStatus.PatternTypeMismatch].
  ///
  /// If pattern has no current patch or the current patch already has at least one side,
  /// pattern will be put into an error status with a status of [CairoStatus.InvalidMeshConstruction].
  ///
  void moveTo(num x, num y);

  ///
  /// Adds a line to the current patch from the current point to position (x , y) in pattern-space coordinates.
  ///
  /// If there is no current point before the call to [lineTo()] this function will behave as [moveTo(x, y)].
  /// After this call the current point will be (x, y).
  ///
  /// Note: If pattern is not a mesh pattern then pattern will be put into an error status with a
  /// status of [CairoStatus.PatternTypeMismatch].
  ///
  /// If pattern has no current patch or the current patch already has 4 sides,
  /// pattern will be put into an error status with a status of [CairoStatus.InvalidMeshConstruction].
  ///
  void lineTo(num x, num y);

  ///
  /// Adds a cubic Bézier spline to the current patch from the current point to position (x3 , y3 ) in pattern-space
  /// coordinates, using (x1 , y1) and (x2 , y2) as the control points.
  ///
  /// If the current patch has no current point before the call to [curveTo()], this method will behave as
  /// if preceded by a call to [moveTo(x1, y1)].
  /// After this call the current point will be (x3, y3).
  ///
  /// Note: If pattern is not a mesh pattern then pattern will be put into an error status with a
  /// status of [CairoStatus.PatternTypeMismatch].
  ///
  /// If pattern has no current patch or the current patch already has 4 sides,
  /// pattern will be put into an error status with a status of [CairoStatus.InvalidMeshConstruction].
  ///
  void curveTo(num x1, num y1, num x2, num y2, num x3, num y3);

  ///
  /// Gets the control point [pointNum] of patch [patchNum] for a mesh pattern.
  ///
  Point getControlPoint(int patchNum, int pointNum);

  ///
  /// Set an internal control point of the current patch.
  ///
  /// Note: If pattern is not a mesh pattern then pattern will be put into an error status with
  /// a status of [CairoStatus.PatternTypeMismatch].
  ///
  /// If pointNum is not valid, pattern will be put into an error status with a
  /// status of [CairoStatus.InvalidIndex]. If pattern has no current patch, pattern will be put into an error
  /// status with a status of [CairoStatus.InvalidMeshConstruction].
  ///
  void setControlPoint(int pointNum, Point p);

  ///
  /// Gets the color information in corner [pointNum] of patch [patchNum] for a mesh pattern.
  ///
  Color getCornerColor(int patchNum, int pointNum);

  ///
  /// Sets the color of a corner of the current patch in a mesh pattern.
  ///
  /// The color is specified in the same way as in [Context.setSourceRgb()].
  ///
  /// Note: If pattern is not a mesh pattern then pattern will be put into an error status with
  /// a status of [CairoStatus.PatternTypeMismatch].
  ///
  /// If corner_num is not valid, pattern will be put into an error status with
  /// a status of [CairoStatus.InvalidIndex]. If pattern has no current patch, pattern will be put into an error
  /// status with a status of [CairoStatus.InvalidMeshConstruction].
  ///
  void setCornerColor(int pointNum, Color color);

  ///
  /// Gets the number of patches specified in the given mesh pattern.
  ///
  /// The number only includes patches which have been finished by calling [endPatch()].
  /// For example it will be 0 during the definition of the first patch.
  ///
  int get patchCount;
}



class _Pattern extends NativeFieldWrapperClass2 implements Pattern {

  _Pattern();

  Extend get extend => new _Extend(_getExtendValue());

  int _getExtendValue() native 'pattern_get_extend';

  void set extend(Extend extend) {
    _setExtendValue(extend.value);
  }

  _setExtendValue(int value) native 'pattern_set_extend';


  PatternType get patternType => new _PatternType(_getPatternType());

  int _getPatternType() native 'pattern_get_type';

  Matrix get matrix native 'pattern_get_matrix';
  void set matrix(Matrix matrix) native 'pattern_set_matrix';

  CairoStatus get status native 'pattern_status';

  @override
  operator==(Pattern pattern) native 'pattern_equals';
}

class _SolidPattern extends _Pattern implements SolidPattern {

  _SolidPattern.fromRgb(double red, double green, double blue) {
    _createFromRgb(red, green, blue);
  }

  _SolidPattern.fromRgba(double red, double green, double blue, double alpha) {
    _createFromRgba(red, green, blue, alpha);
  }

  _SolidPattern(){}

  _SolidPattern.fromColor(Color color, bool solid) {
    if (solid)
      _createFromRgb(color.red, color.green, color.blue);
    else
      _createFromRgba(color.red, color.green, color.blue, color.alpha);
  }

  _createFromRgb(double red, double green, double blue) native 'pattern_create_rgb';
  _createFromRgba(double red, double green, double blue, double alpha) native 'pattern_create_rgba';


  Color get color native 'pattern_get_rgba';
}


class _Gradient extends _Pattern implements Gradient {
  void addColorStop(ColorStop stop) {
    _addColorStop(stop.offset, stop.color.red, stop.color.green, stop.color.blue, stop.color.alpha);
  }

  _addColorStop(double offset, double red, double green, double blue, double alpha) native 'pattern_add_color_stop_rgba';

  ColorStop colorStopAt(int index) native 'pattern_get_color_stop_rgba';
  int get colorStopCount native 'pattern_get_color_stop_count';
}


class _LinearGradient extends _Gradient implements LinearGradient {
  List<Point> get linearPoints native 'pattern_get_linear_points';

  _LinearGradient.internal(){}

  _LinearGradient(double x0, double y0, double x1, double y1) {
    _createLinear(x0, y0, x1, y1);
  }

  _createLinear(double x0, double y0, double x1, double y1) native 'pattern_create_linear';
}


class _RadialGradient extends _Gradient implements RadialGradient {

  _RadialGradient.internal(){}

  _RadialGradient(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1) {
    _createRadial(cx0, cy0, radius0, cx1, cy1, radius1);
  }

  _createRadial(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1) native 'pattern_create_radial';

  List<Circle> get radialCircles native 'pattern_get_radial_circles';
}



class _SurfacePattern extends _Pattern implements SurfacePattern {
  _SurfacePattern(Surface surface) {
    _createForSurface(surface);
  }

  _SurfacePattern.internal(){}

  _createForSurface(Surface surface) native 'pattern_create_for_surface';

  Filter get filter => new _Filter(_getFilterValue());

  int _getFilterValue() native 'pattern_get_filter';

  void set filter(Filter filter) {
    _setFilter(filter.value);
  }

  void _setFilter(int value) native 'pattern_set_filter';

}


class _MeshPattern extends _Pattern implements MeshPattern {
  
  _MeshPattern() {
    _createMesh();
  }
  
  _createMesh() native 'pattern_create_mesh';
  
  void beginPatch() native 'pattern_mesh_begin_patch';
  void endPatch() native 'pattern_mesh_end_patch';
  void moveTo(num x, num y) => _moveTo(x.toDouble(), y.toDouble());
  void lineTo(num x, num y) => _lineTo(x.toDouble(), y.toDouble());
  void curveTo(num x1, num y1, num x2, num y2, num x3, num y3) =>
    _curveTo(x1.toDouble(), y1.toDouble(), x2.toDouble(), y2.toDouble(), x3.toDouble(), y3.toDouble());


  void _moveTo(double x, double y) native 'pattern_mesh_move_to';
  void _lineTo(double x, double y) native 'pattern_mesh_line_to';
  void _curveTo(double x1, double y1, double x2, double y2, double x3, double y3) native 'pattern_mesh_curve_to';
    
  Point getControlPoint(int patchNum, int pointNum) native 'pattern_mesh_get_control_point';
  void setControlPoint(int pointNum, Point p) {
    _setControlPoint(pointNum, p.x, p.y);
  }
    
  void _setControlPoint(int pointNum, double x, double y) native 'pattern_mesh_set_control_point';
  
  Color getCornerColor(int patchNum, int pointNum) native 'pattern_mesh_get_corner_color';
  void setCornerColor(int pointNum, Color color) {
    _setCornerColor(pointNum, color.red, color.green, color.blue, color.alpha);
  }
  
  void _setCornerColor(int pointNum, double red, double green, double blue, double alpha) native 'pattern_mesh_set_corner_color';
    
  int get patchCount native 'pattern_mesh_get_patch_count';
}


