#include <iostream>
#include "string.h"
#include "utils.h"

namespace cairodart
{

namespace infrastructure
{

String::String(const Dart_Handle& handle) : Object(handle)
{
    value = Utils::toString(handle);
}

String::~String()
{
}

} // infrastructure

} // cairodart
