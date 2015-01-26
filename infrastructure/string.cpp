#include <iostream>
#include "string.h"

namespace cairodart
{

namespace infrastructure
{

String::String(const Dart_Handle& handle) : Object(handle)
{
    const char* str;
    // TODO: handle errors
    Dart_StringToCString(handle, &str);
    value = std::string(str);
}

String::~String()
{
}

} // infrastructure

} // cairodart
