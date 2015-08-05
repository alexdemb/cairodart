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
/// The drawing context.
///
/// The Context is used to
/// perform drawing operation on [Surface].
///
///
abstract class Context implements RefObject {

  ///
  /// Creates a new [Context] with all graphics state parameters set to default
  /// values and with target as a target surface.
  ///
  factory Context(Surface surface) {
    return new _Context(surface);
  }

  ///
  /// Makes a copy of the current state of context and saves it on an internal stack of saved states.
  /// When [restore()] is called, cr will be restored to the saved state.
  /// Multiple calls to [save()] and [restore()] can be nested.
  /// each call to [restore()] restores the state from the matching paired [save()].
  ///
  void save();

  ///
  /// Restores context to the state saved by a preceding call to [save()] and
  /// removes that state from the stack of saved states.
  ///
  void restore();

  ///
  /// Temporarily redirects drawing to an intermediate surface known as a group.
  ///
  /// The redirection lasts until the group is completed by a call to [popGroup()] or [popGroupToSource()].
  /// These calls provide the result of any drawing to the group as a pattern,
  /// (either as an explicit object, or set as the source pattern).
  ///
  /// This group functionality can be convenient for performing intermediate compositing.
  /// One common use of a group is to render objects as opaque within the group, (so that they occlude each other),
  /// and then blend the result with translucence onto the destination.
  ///
  /// Groups can be nested arbitrarily deep by making balanced calls to [pushGroup()]/[popGroup()].
  /// Each call pushes/pops the new target group onto/from a stack.
  /// Any changes to the graphics state will not be visible outside the group.
  ///
  /// By default the intermediate group will have a content type of [Content.ColorAndAlpha].
  /// Other content types can be chosen for the group by using [pushGroupWithContent()] instead.
  ///
  void pushGroup();

  ///
  /// Terminates the redirection begun by a call to [pushGroup()] or [pushGroupWithContent()] and returns
  /// a new pattern containing the results of all drawing operations performed to the group.
  /// Any changes to the graphics state will not be visible outside the group.
  ///
  Pattern popGroup();

  ///
  /// Temporarily redirects drawing to an intermediate surface known as a group.
  /// The redirection lasts until the group is completed by a call to [popGroup()] or [popGroupToSource()].
  /// These calls provide the result of any drawing to the group as a pattern,
  /// (either as an explicit object, or set as the source pattern).
  ///
  /// The group will have a content type of specified content.
  /// The ability to control this content type is the only distinction between this method
  /// and [pushGrouop()] which you should see for a more detailed description of group rendering.
  ///
  void pushGroupWithContent(Content content);

  ///
  /// Terminates the redirection begun by a call to [pushGroup()] or [pushGroupWithContent()]
  /// and installs the resulting pattern as the source pattern in the given cairo context.
  ///
  void popGroupToSource();

  ///
  /// Sets the source pattern within context to an opaque color.
  ///
  /// This opaque color will then be used for any subsequent drawing operation until a new source pattern is set.
  /// The color components are floating point numbers in the range 0 to 1.
  ///
  /// If the values passed in are outside that range, they will be clamped.
  /// The default source pattern is opaque black, (that is, it is equivalent to [setSourceRgb(0, 0, 0)]).
  ///
  void setSourceRgb(num red, num green, num blue);

  ///
  /// Sets the source pattern within context to a translucent color.
  ///
  /// This color will then be used for any subsequent drawing operation until a new source pattern is set.
  ///
  /// The color and alpha components are floating point numbers in the range 0 to 1.
  /// If the values passed in are outside that range, they will be clamped.
  ///
  /// The default source pattern is opaque black, (that is, it is equivalent to [setSourceRgba(0, 0, 0, 1)]).
  ///
  void setSourceRgba(num red, num green, num blue, num alpha);

  ///
  /// A drawing operator that strokes the current path according to the current line width,
  /// line join, line cap, and dash settings.
  ///
  /// After [stroke()], the current path will be cleared from the context.
  ///
  /// Note: Degenerate segments and sub-paths are treated specially and provide a useful result.
  /// These can result in two different situations:
  ///
  /// 1. Zero-length "on" segments set in [dash]. If the cap style is [LineCap.Round] or [LineCap.Square] then these
  /// segments will be drawn as circular dots or squares respectively.
  /// In the case of [LineCap.Square], the orientation of the squares is determined by the
  /// direction of the underlying path.
  ///
  /// 2. A sub-path created by [moveTo()] followed by either a [closePath()] or one or more calls to [lineTo()]
  /// to the same coordinate as the [moveTo()].
  /// If the cap style is [LineCap.Round] then these sub-paths will be drawn as circular dots.
  /// Note that in the case of [LineCap.Square] a degenerate sub-path will not be drawn at all,
  /// (since the correct orientation is indeterminate).
  /// In no case will a cap style of [LineCap.Butt] cause anything to be drawn in the case of
  /// either degenerate segments or sub-paths.
  ///
  void stroke();

  ///
  /// Translates the current drawing origin to specified delta.
  ///
  void translate(num tx, num ty);


  ///
  /// Modifies the current transformation matrix (CTM) by scaling the X and Y
  /// user-space axes by sx and sy respectively.
  ///
  /// The scaling of the axes takes place after any existing transformation of user space.
  ///
  void scale(num sx, num sy);

  ///
  /// Applies transformation described by specified [Matrix].
  ///
  void transform(Matrix matrix);

  ///
  /// A drawing operator that strokes the current path according to the current line width, line join,
  /// line cap, and dash settings.
  ///
  /// Unlike [stroke()], preserves the path within the context.
  ///
  void strokePreserve();


  ///
  /// Tests whether the given point is inside the area that would be affected by a [stroke()]
  /// operation given the current path and stroking parameters.
  ///
  /// Surface dimensions and clipping are not taken into account.
  ///
  bool inStroke(num x, num y);

  ///
  /// See [inStroke()]
  ///
  bool pointInStroke(Point p);

  ///
  /// Computes a bounding box in user coordinates covering the area that would be affected,
  /// (the "inked" area), by a [stroke()] operation given the current path and stroke parameters.
  ///
  /// If the current path is empty, returns an empty rectangle ((0,0), (0,0)).
  /// Surface dimensions and clipping are not taken into account.
  ///
  Rectangle get strokeExtents;


  ///
  /// A drawing operator that paints the current source everywhere within the current clip region.
  ///
  void paint();

  ///
  /// A drawing operator that paints the current source everywhere within the current clip region
  /// using a mask of constant alpha value alpha .
  ///
  /// The effect is similar to [paint()], but the drawing is faded out using the alpha value.
  ///
  void paintWithAlpha(double alpha);

  ///
  /// Begin a new sub-path. After this call the current point will be (x, y).
  ///
  void moveTo(num x, num y);

  ///
  /// Begin a new sub-path. After this call the current point will offset by (x , y).
  ///
  /// Given a current point of (x, y), [relativeMoveTo(dx, dy) is logically equivalent to [moveTo(x + dx , y + dy)].
  ///
  /// It is an error to call this method with no current point.
  /// Doing so will cause cr to shutdown with a status of [CairoStatus.NoCurrentPoint].
  ///
  void relativeMoveTo(num x, num y);

  ///
  /// See [moveTo()]
  ///
  void moveToPoint(Point p);

  ///
  /// See [relativeMoveTo()]
  ///
  void relativeMoveToPoint(Point p);

  ///
  /// Adds a line to the path from the current point to position (x, y) in user-space coordinates.
  ///
  /// After this call the current point will be (x, y).
  ///
  /// If there is no current point before the call to [lineTo()] this method will behave
  /// as [moveTo(x, y)].
  ///
  void lineTo(num x, num y);

  ///
  /// Relative-coordinate version of [lineTo()].
  ///
  /// Adds a line to the path from the current point to a point that is offset from the current point
  /// by (dx, dy) in user space.
  ///
  /// After this call the current point will be offset by (dx, dy).
  ///
  /// Given a current point of (x, y), [relativeLineTo(dx, dy)] is logically equivalent to [lineTo(x + dx, y + dy)]..
  ///
  /// It is an error to call this function with no current point.
  /// Doing so will cause cr to shutdown with a status of [CairoStatus.NoCurrentPoint].
  ///
  ///
  void relativeLineTo(num x, num y);

  ///
  /// See [lineTo()]
  ///
  void lineToPoint(Point p);

  ///
  /// See [relativeLineTo()]
  ///
  void relativeLineToPoint(Point p);

  ///
  /// Adds a closed sub-path rectangle of the given size to the current
  /// path at position (x , y) in user-space coordinates.
  ///
  void rectangleByCoords(num x, num y, num width, num height);

  ///
  /// See [rectangleByCoords()]
  ///
  void rectangle(Rectangle rect);

  ///
  /// Clears the current path. After this call there will be no path and no current point.
  ///
  void newPath();

  ///
  /// Begin a new sub-path.
  ///
  /// Note that the existing path is not affected. After this call there will be no current point.
  /// In many cases, this call is not needed since new sub-paths are frequently started with [moveTo()].
  ///
  /// A call to [newSubpath()] is particularly useful when beginning a new sub-path with one of the
  /// [arc()] calls.
  /// This makes things easier as it is no longer necessary to manually compute the arc's initial coordinates
  /// for a call to [moveTo()].
  ///
  void newSubpath();

  ///
  /// Adds a line segment to the path from the current point to the beginning of the current sub-path,
  /// (the most recent point passed to [moveTo()]), and closes this sub-path.
  ///
  /// After this call the current point will be at the joined endpoint of the sub-path.
  /// The behavior of [closePath()] is distinct from simply calling [lineTo()] with the equivalent coordinate
  /// in the case of stroking. When a closed sub-path is stroked, there are no caps on the ends of the sub-path.
  /// Instead, there is a line join connecting the final and initial segments of the sub-path.
  ///
  /// If there is no current point before the call to [closePath()], this method will have no effect.
  ///
  void closePath();

  ///
  /// Adds a circular arc of the given radius to the current path.
  ///
  /// The arc is centered at (xc , yc), begins at angle1 and proceeds in the direction of
  /// increasing angles to end at angle2 .
  /// If angle2 is less than angle1 it will be progressively increased by 2*PI until it is greater than angle1.
  /// If there is a current point, an initial line segment will be added to the path to connect the current point
  /// to the beginning of the arc. If this initial line is undesired,
  /// it can be avoided by calling [newSubpath()] before calling [arc()].
  /// Angles are measured in radians. An angle of 0.0 is in the direction of the positive X axis (in user space).
  /// An angle of PI/2.0 radians (90 degrees) is in the direction of the positive Y axis (in user space).
  /// Angles increase in the direction from the positive X axis toward the positive Y axis.
  /// So with the default transformation matrix, angles increase in a clockwise direction.
  /// (To convert from degrees to radians, use degrees * (PI / 180.).)
  ///
  /// This function gives the arc in the direction of increasing angles.
  /// see [negativeArc()] to get the arc in the direction of decreasing angles.
  ///
  void arc(num xc, num yc, num radius, num angle1, num angle2);

  ///
  /// Adds a circular arc of the given radius to the current path.
  ///
  /// The arc is centered at (xc , yc), begins at angle1 and proceeds in the direction of
  /// decreasing angles to end at angle2.
  /// If angle2 is greater than angle1 it will be progressively
  /// decreased by 2*PI until it is less than angle1.
  ///
  void negativeArc(num xc, num yc, num radius, num angle1, num angle2);

  ///
  /// Adds a cubic Bézier spline to the path from the current point to position (x3, y3) in user-space coordinates,
  /// using (x1 , y1 ) and (x2 , y2 ) as the control points.
  ///
  /// After this call the current point will be (x3 , y3).
  /// If there is no current point before the call to [curveTo()] this method will
  /// behave as if preceded by a call to [moveTo(x1 , y1)].
  ///
  void curveTo(num x1, num y1, num x2, num y2, num x3, num y3);

  ///
  /// Relative-coordinate version of [curveTo()].
  ///
  /// All offsets are relative to the current point. Adds a cubic Bézier spline to the path from the current
  /// point to a point offset from the current point by (dx3 , dy3),
  /// using points offset by (dx1 , dy1) and (dx2, dy2) as the control points.
  ///
  /// After this call the current point will be offset by (dx3, dy3).
  ///
  /// Given a current point of (x, y), [relativeCurveTo(dx1 , dy1, dx2, dy2, dx3, dy3)] is logically equivalent
  /// to [curveTo(x + dx1, y + dy1, x + dx2, y + dy2, x + dx3, y + dy3).
  ///
  /// It is an error to call this function with no current point.
  /// Doing so will cause cr to shutdown with a status of [CairoStatus.NoCurrentPoint].
  ///
  void relativeCurveTo(num x1, num y1, num x2, num y2, num x3, num y3);

  ///
  /// Adds closed paths for text to the current path.
  ///
  /// The generated path if filled, achieves an effect similar to that of [showText()].
  /// Text conversion and positioning is done similar to [showText()].
  /// Like [showText()], After this call the current point is moved to the origin of where the next glyph
  /// would be placed in this same progression.
  /// That is, the current point will be at the origin of the final glyph offset by its advance values.
  /// This allows for chaining multiple calls to to [textPath()] without having to set current point in between.
  ///
  void textPath(String text);

  ///
  /// Establishes a new clip region by intersecting the current clip region with the current path as it would be
  /// filled by [fill()] and according to the current fill rule (see [fillRule]).
  ///
  /// After [clip()], the current path will be cleared from the context.
  /// The current clip region affects all drawing operations by effectively masking out any changes to the surface
  /// that are outside the current clip region.
  /// Calling [clip()] can only make the clip region smaller, never larger.
  /// But the current clip is part of the graphics state,
  /// so a temporary restriction of the clip region can be achieved by calling [clip()] within a
  /// [save()]/[restore()] pair.
  ///
  /// The only other means of increasing the size of the clip region is [resetClip()].
  ///
  void clip();

  ///
  /// Establishes a new clip region by intersecting the current clip region with the current path as it would be
  /// filled by [fill()] and according to the current fill rule (see [fillRule]).
  ///
  /// Unlike [clip()], [clipPreserve()] preserves the path within the context.
  /// The current clip region affects all drawing operations by effectively masking out any changes to the surface
  /// that are outside the current clip region.
  /// Calling [clipPreserve()] can only make the clip region smaller, never larger.
  /// But the current clip is part of the graphics state, so a temporary restriction of the clip region can
  /// be achieved by calling [clipPreserve()] within a [save()]/[restore()] pair.
  /// The only other means of increasing the size of the clip region is [resetClip()].
  ///
  void clipPreserve();

  ///
  /// Tests whether the given point is inside the area that would be visible through the current clip, i.e.
  /// the area that would be filled by a [paint()] operation.
  ///
  bool inClip(num x, num y);

  ///
  /// See [inClip()]
  ///
  bool pointInClip(Point p);

  ///
  /// Reset the current clip region to its original, unrestricted state.
  /// That is, set the clip region to an infinitely large shape containing the target surface.
  /// Equivalently, if infinity is too hard to grasp, one can imagine the clip region being reset to the exact
  /// bounds of the target surface.
  ///
  /// Note that code meant to be reusable should not call [resetClip()] as it will cause results unexpected
  /// by higher-level code which calls [clip()]. Consider using [save()] and [restore()] around [clip()]
  /// as a more robust means of temporarily restricting the clip region.
  ///
  void resetClip();

  /// Computes a bounding box in user coordinates covering the area inside the current clip.
  Rectangle get clipExtents;

  ///
  /// A drawing operator that fills the current path according to the current fill rule,
  /// (each sub-path is implicitly closed before being filled). After [fill()], the current path will be cleared
  /// from the context. See [fillRule] and [fillPreserve()].
  ///
  void fill();

  ///
  /// A drawing operator that fills the current path according to the current fill rule,
  /// (each sub-path is implicitly closed before being filled).
  ///
  /// Unlike [fill()], [fillPreserve()] preserves the path within the cairo context.
  ///
  void fillPreserve();

  ///
  /// Gets the current clip region as a list of rectangles in user coordinates.
  ///
  RectangleList copyClipRectangleList();

  ///
  /// A drawing operator that paints the current source using the alpha channel of pattern as a mask.
  ///
  /// Opaque areas of pattern are painted with the source, transparent areas are not painted.
  ///
  void mask(Pattern pattern);

  ///
  /// A drawing operator that paints the current source using the alpha channel of surface as a mask.
  ///
  /// Opaque areas of surface are painted with the source, transparent areas are not painted.
  ///
  void maskSurface(Surface surface, Point point);

  ///
  /// Emits and clears the current page for backends that support multiple pages.
  /// Use [copyPage()] if you don't want to clear the page.
  ///
  void showPage();

  ///
  /// Emits the current page for backends that support multiple pages,
  /// but doesn't clear it, so, the contents of the current page will be retained for the next page too.
  /// Use [showPage()] if you want to get an empty page after the emission.
  ///
  void copyPage();

  ///
  /// This is a convenience method for creating a pattern from surface and setting it as the
  /// source in context with [source].
  ///
  /// The x and y parameters give the user-space coordinate at which the surface origin should appear.
  /// (The surface origin is its upper-left corner before any transformation has been applied.)
  /// The x and y parameters are negated and then set as translation values in the pattern matrix.
  /// Other than the initial translation pattern matrix, as described above, all other pattern attributes,
  /// (such as its extend mode), are set to the default values.
  ///
  /// The resulting pattern can be queried with [source] so that these attributes can be modified
  /// if desired.
  ///
  void setSourceSurface(Surface surface, num x, num y);

  ///
  /// Selects a specified font for a context.
  ///
  void selectFontFace(String family, FontSlant slant, FontWeight weight);

  ///
  /// Adds closed paths for text to the current path.
  ///
  void showText(String text);

  ///
  /// A drawing operator that generates the shape from an array of glyphs, rendered according to the
  /// current font face, font size (font matrix), and font options.
  ///
  void showGlyphs(List<Glyph> glyphs);

  ///
  /// Gets or sets the current line cap style within the context.
  ///
  /// See [LineCap] for details about how the available line cap styles are drawn.
  /// As with the other stroke parameters, the current line cap style is examined by [stroke()] and,[strokeExtents],
  /// but does not have any effect during path construction.
  ///
  /// The default line cap style is [LineCap.Butt].
  ///
  LineCap lineCap;

  ///
  /// Gets or sets the current line join style within the context.
  ///
  /// See [LineJoin] for details about how the available line join styles are drawn.
  /// As with the other stroke parameters, the current line join style is examined by [stroke()] and [strokeExtents],
  /// but does not have any effect during path construction.
  ///
  /// The default line join style is [LineJoin.Miter].
  ///
  LineJoin lineJoin;

  ///
  /// Gets or sets the current line width within the context.
  ///
  /// The line width value specifies the diameter of a pen that is circular in user space,
  /// (though device-space pen may be an ellipse in general due to scaling/shear/rotation of the CTM).
  ///
  /// Note: When the description above refers to user space and CTM it refers to the user space and CTM in effect
  /// at the time of the stroking operation, not the user space and CTM in effect at the time of the call
  /// to setter of [linewidth].
  ///
  /// The simplest usage makes both of these spaces identical.
  /// That is, if there is no change to the CTM between a call to setter of [lineWidth] and the stroking operation,
  /// then one can just pass user-space values to setter of [lineWidth] and ignore this note.
  /// As with the other stroke parameters, the current line width is examined by [stroke()] and [strokeExtents],
  /// but does not have any effect during path construction.
  ///
  /// The default line width value is 2.0.
  ///
  double lineWidth;

  ///
  /// Gets or sets the current miter limit within the context.
  ///
  /// If the current line join style is set to [LineJoin.Miter], the miter limit is used to determine whether the
  /// lines should be joined with a bevel instead of a miter.
  ///
  /// Cairo divides the length of the miter by the line width. If the result is greater than the miter limit,
  /// the style is converted to a bevel.
  ///
  /// As with the other stroke parameters, the current line miter limit is examined by [stroke()] and [strokeExtents()],
  /// but does not have any effect during path construction.
  ///
  /// The default miter limit value is 10.0, which will convert joins with interior angles less than 11 degrees to
  /// bevels instead of miters.
  /// For reference, a miter limit of 2.0 makes the miter cutoff at 60 degrees, and a miter limit of 1.414 makes
  /// the cutoff at 90 degrees.
  ///
  /// A miter limit for a desired angle can be computed as: miter limit = 1/sin(angle/2)
  ///
  double miterLimit;

  ///
  /// Sets size of current font.
  ///
  void setFontSize(num size);

  ///
  /// Gets or sets the compositing operator to be used for all drawing operations.
  ///
  /// See [Operator] for details on the semantics of each available compositing operator.
  ///
  Operator operator;

  ///
  /// Gets or sets the current fill rule within the context.
  ///
  /// The fill rule is used to determine which regions are inside or outside a complex
  /// (potentially self-intersecting) path.
  /// The current fill rule affects both [fill()] and [clip()].
  ///
  /// See [FillRule] for details on the semantics of each available fill rule.
  /// The default fill rule is [FillRule.Winding].
  ///
  FillRule fillRule;

  ///
  /// Gets or sets the antialiasing mode of the rasterizer used for drawing shapes.
  ///
  /// This value is a hint, and a particular backend may or may not support a particular value.
  /// At the current time, no backend supports [Antialias.Subpixel] when drawing shapes.
  ///
  /// Note that this option does not affect text rendering.
  ///
  Antialias antialias;

  ///
  /// Gets the target surface for the cairo context as passed to the constructor.
  ///
  Surface get target;

  ///
  /// Gets or sets the source pattern within cr to source.
  ///
  /// This pattern will then be used for any subsequent drawing operation until a new source pattern is set.
  ///
  /// Note: The pattern's transformation matrix will be locked to the user space in effect at the time of setter of
  /// [source].
  ///
  /// This means that further modifications of the current transformation matrix will not affect the source pattern.
  ///
  /// The default source pattern is a solid pattern that is opaque black,
  /// (that is, it is equivalent to [setSourceRgb(0, 0, 0)]).
  ///
  Pattern source;

  ///
  /// Returns whether a current point is defined on the current path.
  ///
  /// See [currentPoint] for details on the current point.
  ///
  bool get hasCurrentPoint;

  ///
  /// Gets the current point of the current path, which is conceptually the final point reached by the path so far.
  ///
  /// The current point is returned in the user-space coordinate system.
  /// If there is no defined current point or if context is in an error status, x and y will both be set to 0.0.
  ///
  /// It is possible to check this in advance with [hasCurrentPoint()].
  ///
  /// Most path construction functions alter the current point.
  /// See the following for details on how they affect the current point: [newPath()], [newSubpath()], [closePath()],
  /// [moveTo()], [lineTo()], [curveTo()], [relativeMoveTo()], [relativeLineTo()],
  /// [relativeCurveTo()], [arc()], [negativeArc()], [rectangle()], [textPath()].
  ///
  /// Some methods use and alter the current point but do not otherwise change current path: [showText()].
  /// Some methods unset the current path and as a result, current point: [fill()], [stroke()].
  ///
  Point get currentPoint;

  ///
  /// Computes a bounding box in user-space coordinates covering the points on the current path.
  ///
  /// If the current path is empty, returns an empty rectangle ((0,0), (0,0)).
  ///
  /// Stroke parameters, fill rule, surface dimensions and clipping are not taken into account.
  ///
  Rectangle get pathExtents;

  ///
  /// Gets or sets the tolerance used when converting paths into trapezoids.
  ///
  /// Curved segments of the path will be subdivided until the maximum deviation between the original path and
  /// the polygonal approximation is less than tolerance.
  ///
  /// The default value is 0.1. A larger value will give better performance, a smaller value, better appearance.
  /// (Reducing the value from the default value of 0.1 is unlikely to improve appearance significantly.)
  ///
  /// The accuracy of paths within Cairo is limited by the precision of its internal arithmetic,
  /// and the prescribed tolerance is restricted to the smallest representable internal value.
  ///
  double tolerance;

  ///
  /// Gets or sets the dash pattern to be used by [stroke()].
  ///
  /// A dash pattern is specified by dashes, an array of positive values.
  /// Each value provides the length of alternate "on" and "off" portions of the stroke.
  /// The offset specifies an offset into the pattern at which the stroke begins.
  /// Each "on" segment will have caps applied as if the segment were a separate sub-path.
  /// In particular, it is valid to use an "on" length of 0.0 with [LineCap.Round] or [LineCap.Square]
  /// in order to distributed dots or squares along a path.
  ///
  /// Note: The length values are in user-space units as evaluated at the time of stroking.
  /// This is not necessarily the same as the user space at the time of the setter of [dash()].
  ///
  /// If count of dashes is 0 dashing is disabled.
  /// If count of dashes is 1 a symmetric pattern is assumed with alternating on and off portions of the size
  /// specified by the single value in dashes .
  /// If any value in dashes is negative, or if all values are 0, then cr will be put into an error state with a
  /// status of [CairoStatus.InvalidDash].
  ///
  Dash dash;

  ///
  /// Gets the length of the dash array in cr (0 if dashing is not currently in effect).
  ///
  int get dashCount;


  ///
  /// Gets the current destination surface for the context.
  ///
  /// This is either the original target surface as passed to constructor or the target surface for the current
  /// group as started by the most recent call to [pushGroup()] or [pushGroupWithContent()].
  ///
  Surface get groupTarget;

  ///
  /// Sets the current font matrix to matrix .
  ///
  /// The font matrix gives a transformation from the design space of the font
  /// (in this space, the em-square is 1 unit by 1 unit) to user space.
  ///
  /// Normally, a simple scale is used (see [setFontSize()]), but a more complex font matrix
  /// can be used to shear the font or stretch it unequally along the two axes.
  ///
  Matrix fontMatrix;

  ///
  /// Gets or sets a set of custom font rendering options for the context.
  ///
  /// Rendering options are derived by merging these options with the options derived from underlying surface;
  /// if the value in options has a default value, then the value from the surface is used.
  ///
  FontOptions fontOptions;

  ///
  /// Gets or sets the current [FontFace] object in the context.
  ///
  FontFace fontFace;

  ///
  /// Gets or sets the current font face, font matrix, and font options in the context with
  /// those of the [ScaledFont].
  ///
  /// Except for some translation, the current CTM of the context should be the same as that of the [ScaledFont],
  /// which can be accessed using [ctm].
  ///
  ScaledFont scaledFont;

  ///
  /// Gets the font extents for the currently selected font.
  ///
  FontExtents get fontExtents;

  ///
  /// Gets the extents for a string of text.
  ///
  /// The extents describe a user-space rectangle that encloses the "inked" portion of the text,
  /// (as it would be drawn by [showText()]).
  ///
  /// Additionally, the x_advance and y_advance values indicate the amount by which the current point
  /// would be advanced by [showText()].
  ///
  /// Note that whitespace characters do not directly contribute to the size of the rectangle
  /// (extents.width and extents.height).
  /// They do contribute indirectly by changing the position of non-whitespace characters.
  ///
  /// In particular, trailing whitespace characters are likely to not affect the size of the rectangle,
  /// though they will affect the x_advance and y_advance values.
  ///
  TextExtents textExtents(String text);


  ///
  /// Gets the extents for a list of glyphs.
  ///
  /// The extents describe a user-space rectangle that encloses the "inked" portion of the glyphs,
  /// (as they would be drawn by [showGlyphs()]).
  ///
  /// Additionally, the x_advance and y_advance values indicate the amount by which the current point would be
  /// advanced by [showGlyphs()].
  ///
  /// Note that whitespace glyphs do not contribute to the size of the rectangle (extents.width and extents.height).
  ///
  TextExtents glyphsExtents(List<Glyph> glyphs);


  ///
  /// This operation has rendering effects similar to [showGlyphs()] but,
  /// if the target surface supports it, uses the provided text and cluster mapping to embed the text for the
  /// glyphs shown in the output.
  ///
  /// If the target does not support the extended attributes, this function acts like the basic [showGlyphs()] as
  /// if it had been passed glyphs.
  ///
  /// The mapping between text and glyphs is provided by an list of clusters. Each cluster covers a number of text
  /// bytes and glyphs, and neighboring clusters cover neighboring areas of text and glyphs .
  /// The clusters should collectively cover text and glyphs in entirety.
  ///
  /// The first cluster always covers bytes from the beginning of text. If cluster_flags do not have
  /// the [TextClusterFlags.Backward] set, the first cluster also covers the beginning of glyphs,
  /// otherwise it covers the end of the glyphs array and following clusters move backward.
  /// See [TextCluster] for constraints on valid clusters.
  ///
  void showTextGlyphs(String text, List<Glyph> glyphs, List<TextCluster> clusters, TextClusterFlags flags);
}


class _Context extends NativeFieldWrapperClass2 implements Context {
  
  Surface _surface;
  
  _Context(this._surface) {
    _create(_surface);
  }
  
  void _create(Surface surface) native 'context_create';
  
  void save() native 'save';
  
  void restore() native 'restore';
  
  void pushGroup() native 'push_group';
  
  void pushGroupWithContent(Content content) {
    _pushGroupWithContent(content.value);
  }
  
  void _pushGroupWithContent(int value) native 'push_group_with_content';
  
  void popGroupToSource() native 'pop_group_to_source';

  void setSourceRgb(num red, num green, num blue) => _setSourceRgb(red.toDouble(), green.toDouble(), blue.toDouble());

  void _setSourceRgb(double red, double green, double blue) native 'set_source_rgb';

  void setSourceRgba(num red, num green, num blue, num alpha) => _setSourceRgba(red.toDouble(), green.toDouble(), blue.toDouble(), alpha.toDouble());

  void _setSourceRgba(double red, double green, double blue, double alpha) native 'set_source_rgba';
  
  void stroke() native 'stroke';
  
  void strokePreserve() native 'stroke_preserve';
  
  bool inStroke(num x, num y) => _inStroke(x.toDouble(), y.toDouble());

  bool pointInStroke(Point p) => inStroke(p.x.toDouble(), p.y.toDouble());
    
  bool _inStroke(double x, double y) native 'in_stroke';  
  
  Rectangle get strokeExtents native 'stroke_extents';
  
  void paint() native 'paint';
  
  Surface get target => _surface;
  
  LineCap get lineCap native 'get_line_cap';
  
  void set lineCap(LineCap cap) => _setLineCap(cap.value);
  
  void _setLineCap(int value) native 'set_line_cap';
  
  LineJoin get lineJoin native 'get_line_join';
  
  void set lineJoin(LineJoin join) => _setLineJoin(join.value);
  
  void _setLineJoin(int value) native 'set_line_join';
  
  double get lineWidth native 'get_line_width';
  
  void set lineWidth(double width) native 'set_line_width';
  
  double get miterLimit native 'get_miter_limit';
  
  void set miterLimit(double limit) native 'set_miter_limit';
  
  Operator get operator native 'get_operator';
  
  void set operator(Operator op) => _setOperator(op.value);
  
  void _setOperator(int val) native 'set_operator';
  
  FillRule get fillRule native 'get_fill_rule';
  
  void set fillRule(FillRule rule) => _setFillRule(rule.value);
  
  void _setFillRule(int val) native 'set_fill_rule';
  
  Antialias get antialias native 'get_antialias';
  
  void set antialias(Antialias antialias) => _setAntialias(antialias.value);
  
  void _setAntialias(int val) native 'set_antialias';
  
  bool get hasCurrentPoint native 'has_current_point';

  void moveTo(num x, num y) => _moveTo(x.toDouble(), y.toDouble());

  void _moveTo(double x, double y) native 'move_to';
  
  void moveToPoint(Point p) => moveTo(p.x, p.y);

  void lineTo(num x, num y) => _lineTo(x.toDouble(), y.toDouble());

  void _lineTo(double x, double y) native 'line_to';
  
  void lineToPoint(Point p) => lineTo(p.x, p.y);

  void rectangleByCoords(num x, num y, num width, num height) => _rectangleByCoords(x.toDouble(), y.toDouble(), width.toDouble(), height.toDouble());

  void _rectangleByCoords(double x, double y, double width, double height) native 'rectangle';
  
  void rectangle(Rectangle rect) => rectangleByCoords(rect.x.toDouble(), rect.y.toDouble(), rect.width.toDouble(), rect.height.toDouble());
  
  Point get currentPoint native 'get_current_point';
  
  void newPath() native 'new_path';
  
  void newSubpath() native 'new_sub_path';
  
  void closePath() native 'close_path';

  void arc(num xc, num yc, num radius, num angle1, num angle2) => _arc(xc.toDouble(), yc.toDouble(), radius.toDouble(), angle1.toDouble(), angle2.toDouble());

  void _arc(double xc, double yc, double radius, double angle1, double angle2) native 'arc';

  void negativeArc(num xc, num yc, num radius, num angle1, num angle2) => _negativeArc(xc.toDouble(), yc.toDouble(), radius.toDouble(), angle1.toDouble(), angle2.toDouble());

  void _negativeArc(double xc, double yc, double radius, double angle1, double angle2) native 'arc_negative';

  void curveTo(num x1, num y1, num x2, num y2, num x3, num y3) => _curveTo(x1.toDouble(), y1.toDouble(), x2.toDouble(), y2.toDouble(), x3.toDouble(), y3.toDouble());

  void _curveTo(double x1, double y1, double x2, double y2, double x3, double y3) native 'curve_to';

  void relativeCurveTo(num x1, num y1, num x2, num y2, num x3, num y3) => _relativeCurveTo(x1.toDouble(), y1.toDouble(), x2.toDouble(), y2.toDouble(), x3.toDouble(), y3.toDouble());

  void _relativeCurveTo(double x1, double y1, double x2, double y2, double x3, double y3) native 'rel_curve_to';

  void relativeMoveTo(num x, num y) => _relativeMoveTo(x.toDouble(), y.toDouble());

  void _relativeMoveTo(double x, double y) native 'rel_move_to';
  
  void relativeMoveToPoint(Point p) => relativeMoveTo(p.x, p.y);
  
  void relativeLineTo(num x, num y) => _relativeLineTo(x.toDouble(), y.toDouble());

  void _relativeLineTo(double x, double y) native 'rel_line_to';
  
  void relativeLineToPoint(Point p) => relativeLineTo(p.x, p.y);
  
  void textPath(String text) native 'text_path';
  
  Rectangle get pathExtents native 'path_extents';
  
  double get tolerance native 'get_tolerance';
  
  void set tolerance(double tolerance) native 'set_tolerance';
  
  void clip() native 'clip';
  
  void clipPreserve() native 'clip_preserve';
  
  bool inClip(num x, num y) => _inClip(x.toDouble(), y.toDouble());

  bool pointInClip(Point p) => inClip(p.x.toDouble(), p.y.toDouble());
  
  bool _inClip(double x, double y) native 'in_clip';
  
  void resetClip() native 'reset_clip';
  
  Rectangle get clipExtents native 'clip_extents';
  
  void fill() native 'fill';
  
  void fillPreserve() native 'fill_preserve';
  
  Rectangle get fillExtents native 'fill_extents';
  
  bool inFill(num x, num y) => _inFill(x.toDouble(), y.toDouble());
  
  bool pointInFill(Point p) => inFill(p.x.toDouble(), p.y.toDouble());
  
  bool _inFill(double x, double y) native 'in_fill';
  
  RectangleList copyClipRectangleList() native 'copy_clip_rectangle_list';

  void translate(num tx, num ty) => _translate(tx.toDouble(), ty.toDouble());

  void _translate(double tx, double ty) native 'translate';

  void transform(Matrix matrix) native 'transform';

  void _destroyRectangleList(RectangleList rectList) native 'rectangle_list_destroy';
  
  void mask(Pattern pattern) native 'mask';
  
  void maskSurface(Surface surface, Point point) => _maskSurface(surface, point.x.toDouble(), point.y.toDouble());
  
  void _maskSurface(Surface surface, double x, double y) native 'mask_surface';
  
  void paintWithAlpha(double alpha) native 'paint_with_alpha';
  
  void showPage() native 'show_page';
  
  void copyPage() native 'copy_page';
  
  Dash get dash native 'get_dash';
  
  void set dash(Dash dash) => _setDash(dash.dashes, dash.offset);
  
  void _setDash(List<double> dashes, double offset) native 'set_dash';
  
  int get dashCount native 'get_dash_count';
  
  Pattern popGroup() native 'pop_group';
  
  Pattern get source native 'get_source';
  
  void set source(Pattern pattern) native 'set_source';

  void setSourceSurface(Surface surface, num x, num y) => _setSourceSurface(surface, x.toDouble(), y.toDouble());

  void _setSourceSurface(Surface surface, double x, double y) native 'set_source_surface';
  
  Surface get groupTarget native 'get_group_target';

  void selectFontFace(String family, FontSlant slant, FontWeight weight) => _selectFontFace(family, slant.value, weight.value);

  void _selectFontFace(String family, int slant, int weight) native 'select_font_face';

  void setFontSize(num s) => _setFontSize(s.toDouble());

  void _setFontSize(double s) native 'set_font_size';

  void showText(String text) native 'show_text';

  Matrix get fontMatrix native 'get_font_matrix';

  void set fontMatrix(Matrix fontMatrix) native 'set_font_matrix';

  FontOptions get fontOptions native 'get_font_options';

  void set fontOptions(FontOptions fontOptions) native 'set_font_options';

  FontFace get fontFace native 'get_font_face';

  void set fontFace(FontFace fontFace) native 'set_font_face';

  ScaledFont get scaledFont native 'get_scaled_font';

  void set scaledFont(ScaledFont scaledFont) native 'set_scaled_font';

  void showGlyphs(List<Glyph> glyphs) native 'show_glyphs';

  FontExtents get fontExtents native 'font_extents';

  TextExtents textExtents(String text) native 'text_extents';

  TextExtents glyphsExtents(List<Glyph> glyphs) native 'glyph_extents';

  void showTextGlyphs(String text, List<Glyph> glyphs, List<TextCluster> clusters, TextClusterFlags flags) {
    _showTextGlyphs(text, glyphs, clusters, flags.value);
  }

  void _showTextGlyphs(String text, List<Glyph> glyphs, List<TextCluster> clusters, int flags) native 'show_text_glyphs';

  void scale(num sx, num sy) => _scale(sx.toDouble(), sy.toDouble());

  void _scale(double sx, double sy) native 'scale';

  CairoStatus get status native 'status';
}

