#include "boolean.h"
#include "utils.h"

namespace cairodart
{

namespace infrastructure
{

Boolean::Boolean(const Dart_Handle& handle) : Object(handle)
{
    value = Utils::toBoolean(handle);
}

} // infrastructure

} // cairodart
