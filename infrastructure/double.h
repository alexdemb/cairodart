#ifndef DOUBLE_H
#define DOUBLE_H

#include "object.h"
#include "dart_api.h"

namespace cairodart
{

namespace infrastructure
{

class Double : public Object<double>
{
public:
    Double(const Dart_Handle& handle);
};

} // infrastructure

} // cairodart

#endif // DOUBLE_H
