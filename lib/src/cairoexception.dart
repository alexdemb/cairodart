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
/// General exception for CairoDart rendering operations.
///
/// This [status] property provides information about status of underlying cairo object.
///
class CairoException implements Exception {
  String cause;
  CairoStatus status;

  CairoException(this.cause, this.status);
  
  @override
  String toString() => 'Cause: $cause, Status: ${status.statusCode}';
}

///
/// Status of cairo underlying object.
///
class CairoStatus {

  /// No error has occurred.
  static final CairoStatus Success = new CairoStatus(0);

  /// Out of memory
  static final CairoStatus NoMemory = new CairoStatus(1);

  /// [Context.restore()] called without mathing [Context.save()]
  static final CairoStatus InvalidRestore = new CairoStatus(2);

  /// No saved group to pop, i.e. call [Context.popGroup()]
  /// without matching [Context.pushGroup()]
  static final CairoStatus InvalidPopGroup = new CairoStatus(3);

  /// No current point defined.
  static final CairoStatus NoCurrentPoint = new CairoStatus(4);

  /// Invalid matrix (not invertible)
  static final CairoStatus InvalidMatrix = new CairoStatus(5);

  /// invalid value for an status.
  static final CairoStatus InvalidStatus = new CairoStatus(6);

  /// Null pointer
  static final CairoStatus NullPointer = new CairoStatus(7);

  /// Input string not valid UTF-8
  static final CairoStatus InvalidString = new CairoStatus(8);

  /// Input path data not valid
  static final CairoStatus InvalidPathData = new CairoStatus(9);

  /// Error while reading from input stream
  static final CairoStatus ReadError = new CairoStatus(10);

  /// Error while writing to output stream
  static final CairoStatus WriteError = new CairoStatus(11);

  /// Target surface has been finished
  static final CairoStatus SurfaceFinished = new CairoStatus(12);

  /// The surface type is not appropriate for the operation
  static final CairoStatus SurfaceTypeMismatch = new CairoStatus(13);

  /// The pattern type is not appropriate for the operation
  static final CairoStatus PatternTypeMismatch = new CairoStatus(14);

  /// invalid value for an input [Content]
  static final CairoStatus InvalidContent = new CairoStatus(15);

  /// Invalid value for an input [Format]
  static final CairoStatus InvalidFormat = new CairoStatus(16);

  /// Invalid value for an input Visual*
  static final CairoStatus InvalidVisual = new CairoStatus(17);

  /// File not found
  static final CairoStatus FileNotFound = new CairoStatus(18);

  /// Invalid value for a dash setting
  static final CairoStatus InvalidDash = new CairoStatus(19);

  /// Invalid value for a DSC comment
  static final CairoStatus InvalidDscComment = new CairoStatus(20);

  /// Invalid index passed to getter
  static final CairoStatus InvalidIndex = new CairoStatus(21);

  /// Clip region not representable in desired format
  static final CairoStatus ClipNotRepresentable = new CairoStatus(22);

  /// Error creating or writing to a temporary file
  static final CairoStatus TempFileError = new CairoStatus(23);

  /// Invalid value for stride
  static final CairoStatus InvalidStride = new CairoStatus(24);

  /// The font type is not appropriate for the operation
  static final CairoStatus FontTypeMismatch = new CairoStatus(25);

  /// The user-font is immutable
  static final CairoStatus UserFontImmutable = new CairoStatus(26);

  /// Error occurred in a user-font callback function
  static final CairoStatus UserFontError = new CairoStatus(27);

  /// Negative number used where it is not allowed
  static final CairoStatus NegativeCount = new CairoStatus(28);

  /// Input clusters do not represent the accompanying text and glyph array
  static final CairoStatus InvalidClusters = new CairoStatus(29);

  /// Invalid value for an input [FontSlant]
  static final CairoStatus InvalidSlant = new CairoStatus(30);

  /// Invalid value for an input [FontWeight]
  static final CairoStatus InvalidWeight = new CairoStatus(31);

  /// Invalid value (typically too big) for the size of the input (surface, pattern, etc)
  static final CairoStatus InvalidSize = new CairoStatus(32);

  /// User-font method not implemented
  static final CairoStatus UserFontNotImplemented = new CairoStatus(33);

  /// The device type is not appropriate for the operation
  static final CairoStatus DeviceTypeMismatch = new CairoStatus(34);

  /// An operation to the device caused an unspecified error
  static final CairoStatus DeviceError = new CairoStatus(35);

  /// a mesh pattern construction operation was used outside of a
  /// [MeshPattern.beginPatch()]/[MeshPattern.endPatch()]
  static final CairoStatus InvalidMeshConstruction = new CairoStatus(36);

  /// Target device has been finished
  static final CairoStatus DeviceFinished = new CairoStatus(37);

  /// This is a special value indicating the number of status values defined in this enumeration
  static final CairoStatus LastStatus = new CairoStatus(38);

  int statusCode;

  CairoStatus(this.statusCode);

  @override
  operator==(CairoStatus other) => other.statusCode == this.statusCode;
}
