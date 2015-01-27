#include "double.h"
#include "utils.h"

namespace cairodart
{

namespace infrastructure
{

Double::Double(const Dart_Handle& handle) : Object(handle)
{
    value = Utils::toDouble(handle);
}

} // infrastructure

} // cairodart
