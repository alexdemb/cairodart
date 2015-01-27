#ifndef BOOLEAN_H
#define BOOLEAN_H

#include "object.h"
#include "dart_api.h"

namespace cairodart
{

namespace infrastructure
{

class Boolean : public Object<bool>
{
public:
    Boolean(const Dart_Handle& handle);
};


} // infrastructure

} // cairodart

#endif // BOOLEAN_H
