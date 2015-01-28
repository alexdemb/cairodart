#ifndef UTILS_H
#define UTILS_H

#include <string>
#include "dart_api.h"

namespace cairodart
{

namespace infrastructure
{

class Utils
{
public:
    static void propagateError(const Dart_Handle& handle);
    static void newError(const std::string& msg);
    static bool isString(const Dart_Handle& handle);
    static bool isInteger(const Dart_Handle& handle);
    static bool isDouble(const Dart_Handle& handle);
    static bool isBoolean(const Dart_Handle& handle);
    static std::string toString(const Dart_Handle& handle);
    static double toDouble(const Dart_Handle& handle);
    static bool toBoolean(const Dart_Handle& handke);
private:
    Utils();
};

} // infrastructure

} // cairodart


#endif // UTILS_H
