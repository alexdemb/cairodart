#ifndef STRING_H
#define STRING_H

#include <iostream>
#include "object.h"

namespace cairodart
{

namespace infrastructure
{


class String : public Object<std::string>
{
public:
    String(const Dart_Handle& handle);
    virtual ~String();
};

} // infrastructure

} // cairodart

#endif // STRING_H
