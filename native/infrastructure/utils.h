#ifndef UTILS_H
#define UTILS_H

#include <string>
#include "dart_api.h"
#include <cairo/cairo.h>
#include <cstdint>
#include "infrastructure.h"
#include <cstdarg>

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
    static void verify(cairo_status_t& status);
    static Dart_Handle newObject(const std::string& className, const std::string& constructor, int argc, Dart_Handle* args);
    static Dart_Handle newPoint(const double& x, const double& y);
    static Dart_Handle newCircle(const double& x, const double& y, const double& radius);
    static Dart_Handle newDistance(const double& dx, const double& dy);
    static Dart_Handle newList(int count, ...);
    static Dart_Handle newEmptyList(int count);
    static Dart_Handle newRectangle(const int& x, const int& y, const int& width, const int& height);
    static Dart_Handle newRectangle(const double& x, const double& y, const double& width, const double& height);
    static Dart_Handle newRectangleList(const Dart_Handle& context, const cairo_rectangle_list_t* list);
    static int listLength(const Dart_Handle& list);
    static int intAt(const Dart_Handle& list, const int& pos);
    static double doubleAt(const Dart_Handle& list, const int& pos);

    template<typename T>
    static T* thisFromArg(Dart_NativeArguments& args)
    {
        Dart_Handle handle = Dart_GetNativeArgument(args, 0);
        propagateError(handle);
        return bindingObject<T>(handle);
    }

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

    static void doNothingCallback(void* isolateCallbackData, Dart_WeakPersistentHandle weakHandle, void* peer)
    {
        UNUSED(isolateCallbackData);
        UNUSED(weakHandle);
        UNUSED(peer);
    }

    template<typename T>
    static T* bindingObject(Dart_Handle& handle)
    {
        intptr_t ptr;
        propagateError(Dart_GetNativeInstanceField(handle, 0, &ptr));

        return (T*) ptr;
    }

    template<typename T>
    static void setupBindingObject(Dart_Handle& handle, T* obj, bool performFinalize = true)
    {
        intptr_t ptr = (intptr_t) obj;
        propagateError(Dart_SetNativeInstanceField(handle, 0, ptr));
        if (performFinalize)
        {
            Dart_NewWeakPersistentHandle(handle, (void*)ptr, 0, finalize<T>);
        }
        else
        {
            Dart_NewWeakPersistentHandle(handle, (void*)ptr, 0, doNothingCallback);
        }
    }
private:
    Utils();
};

} // infrastructure

} // cairodart


#endif // UTILS_H
