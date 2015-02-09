#include "utils.h"

namespace cairodart
{

namespace infrastructure
{

Utils::Utils()
{
}

void Utils::propagateError(const Dart_Handle& handle)
{
    if (Dart_IsError(handle))
    {
        Dart_PropagateError(handle);
    }
}

void Utils::newError(const std::string& msg)
{
    Dart_NewApiError(msg.c_str());
}

bool Utils::isString(const Dart_Handle& handle)
{
    return Dart_IsString(handle);
}

bool Utils::isInteger(const Dart_Handle& handle)
{
    return Dart_IsInteger(handle);
}

bool Utils::isDouble(const Dart_Handle& handle)
{
    return Dart_IsDouble(handle);
}

bool Utils::isBoolean(const Dart_Handle& handle)
{
    return Dart_IsBoolean(handle);
}

std::string Utils::toString(const Dart_Handle& handle)
{
    const char* buff;
    propagateError(Dart_StringToCString(handle, &buff));
    return std::string(buff);
}

double Utils::toDouble(const Dart_Handle &handle)
{
    double num;
    propagateError(Dart_DoubleValue(handle, &num));
    return num;
}

bool Utils::toBoolean(const Dart_Handle &handle)
{
    bool val;
    propagateError(Dart_BooleanValue(handle, &val));
    return val;
}

int64_t Utils::toInteger(const Dart_Handle& handle)
{
    int64_t val;
    propagateError(Dart_IntegerToInt64(handle, &val));
    return val;
}

void Utils::verify(cairo_status_t& status)
{
    if (status != CAIRO_STATUS_SUCCESS)
    {
        const char* message = cairo_status_to_string(status);
        if (message)
        {
            propagateError(Dart_NewApiError(message));
        }
    }
}


Dart_Handle Utils::newObject(const std::string& className, const std::string& constructor, int argc, Dart_Handle *args)
{
    Dart_Handle constructorName = constructor.empty() ? Dart_Null() : Dart_NewStringFromCString(constructor.c_str());
    Dart_Handle clazz = Dart_NewStringFromCString(className.c_str());
    Dart_Handle type = Dart_GetClass(cairodart::infrastructure::getLibrary(), clazz);
    propagateError(type);
    Dart_Handle obj = Dart_New(type, constructorName, argc, args);
    propagateError(obj);
    return obj;
}

} // infrastructure

} // cairodart
