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

abstract class Resolution {
  
  factory Resolution(num xRes, num yRes) => new _Resolution(xRes, yRes);
  
  num get xResolution;
  num get yResolution;
  
}

class _Resolution implements Resolution {

  num _xResolution;
  num _yResolution;
  
  _Resolution(this._xResolution, this._yResolution);

  num get xResolution => _xResolution;
  num get yResolution => _yResolution;
}
