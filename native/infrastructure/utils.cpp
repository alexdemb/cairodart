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
        Dart_Handle args[2] = { Dart_NewStringFromCString(message), Dart_NewInteger(static_cast<int>(status)) };
        Dart_Handle ex = newObject("CairoException", "", 2, args);

        Dart_ThrowException(ex);
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

Dart_Handle Utils::newPoint(const double& x, const double& y)
{
    Dart_Handle args[2] = { Dart_NewDouble(x), Dart_NewDouble(y) };
    return newObject("Point", "from", 2, args);
}

Dart_Handle Utils::newCircle(const double& x, const double& y, const double& radius)
{
    Dart_Handle args[3] = { Dart_NewDouble(x), Dart_NewDouble(y), Dart_NewDouble(radius) };
    return newObject("Circle", "", 3, args);
}

Dart_Handle Utils::newDistance(const double& dx, const double& dy)
{
    Dart_Handle args[2] = { Dart_NewDouble(dx), Dart_NewDouble(dy) };
    return newObject("Distance", "from", 2, args);
}

Dart_Handle Utils::newList(int count, ...)
{
    Dart_Handle list = Dart_NewList(static_cast<intptr_t>(count));
    std::va_list vl;
    va_start(vl, count);

    Dart_Handle val;

    for (int i = 0; i < count; i++) {
        val = va_arg(vl, Dart_Handle);
        Dart_ListSetAt(list, i, val);
    }

    va_end(vl);
    return list;
}

int Utils::listLength(const Dart_Handle& list)
{
    intptr_t length = 0;
    Dart_Handle res = Dart_ListLength(list, &length);
    propagateError(res);
    return static_cast<int>(length);
}

int Utils::intAt(const Dart_Handle &list, const int &pos)
{
    intptr_t i = static_cast<intptr_t>(pos);
    Dart_Handle res = Dart_ListGetAt(list, i);
    propagateError(res);
    int64_t conv = toInteger(res);
    return static_cast<int>(conv);
}

Dart_Handle Utils::newRectangle(const int &x, const int &y, const int &width, const int &height)
{
    const int COUNT_OF_PARAMS = 4;
    Dart_Handle parameters[COUNT_OF_PARAMS] =
    {
        Dart_NewInteger(x),
        Dart_NewInteger(y),
        Dart_NewInteger(width),
        Dart_NewInteger(height)
    };

    Dart_Handle rect = Utils::newObject("Rectangle", "", COUNT_OF_PARAMS, parameters);
    return rect;
}

Dart_Handle Utils::newRectangle(const double &x, const double &y, const double &width, const double &height)
{
    const int COUNT_OF_PARAMS = 4;
    Dart_Handle parameters[COUNT_OF_PARAMS] =
    {
        Dart_NewDouble(x),
        Dart_NewDouble(y),
        Dart_NewDouble(width),
        Dart_NewDouble(height)
    };

    Dart_Handle rect = Utils::newObject("Rectangle", "", COUNT_OF_PARAMS, parameters);
    return rect;
}

} // infrastructure

} // cairodart
