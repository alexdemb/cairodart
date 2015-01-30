#ifndef UTILS_H
#define UTILS_H

#include <string>
#include "dart_api.h"
#include <cairo/cairo.h>
#include <cstdint>
#include "infrastructure.h"

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
    static bool toBoolean(const Dart_Handle& handle);
    static int64_t toInteger(const Dart_Handle& handle);
    static Dart_Handle getField(const Dart_Handle& handle, const std::string& fieldName);
    static void verify(cairo_status_t& status);

    template<typename T>
    static void finalize(void* isolateCallbackData, Dart_WeakPersistentHandle weakHandle, void* peer)
    {
        UNUSED(isolateCallbackData);
        UNUSED(weakHandle);

        T* obj = static_cast<T*>(peer);
        if (obj)
        {
            delete obj;
        }
    }

    template<typename T>
    static T* bindingObject(Dart_Handle& handle)
    {
        intptr_t ptr;
        propagateError(Dart_GetNativeInstanceField(handle, 0, &ptr));

        return (T*) ptr;
    }

    template<typename T>
    static void setupBindingObject(Dart_Handle& handle, T* obj)
    {
        intptr_t ptr = (intptr_t) obj;
        propagateError(Dart_SetNativeInstanceField(handle, 0, ptr));
        Dart_NewWeakPersistentHandle(handle, (void*)ptr, 0, finalize<T>);
    }
private:
    Utils();
};

} // infrastructure

} // cairodart


#endif // UTILS_H
