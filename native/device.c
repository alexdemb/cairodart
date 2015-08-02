#include <cairo/cairo.h>
#include <cairo/cairo-script.h>
#include "dart_api.h"

#include "argument.h"
#include "error.h"
#include "factory.h"
#include "bind.h"
#include "device.h"

void device_destroy(void* handle) {
    if (handle) {
        cairo_device_t* device = (cairo_device_t*) handle;
        if (device) {
            cairo_device_destroy(device);
        }
    }
}

void device_finish(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_device_t* device = (cairo_device_t*)bind_get_self(args);

    cairo_device_finish(device);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void device_flush(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_device_t* device = (cairo_device_t*)bind_get_self(args);

    cairo_device_flush(device);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void device_acquire(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_device_t* device = (cairo_device_t*)bind_get_self(args);

    cairo_status_t status = cairo_device_acquire(device);

    error_verify(status);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void device_release(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_device_t* device = (cairo_device_t*)bind_get_self(args);

    cairo_device_release(device);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void device_get_type(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_device_t* device = (cairo_device_t*)bind_get_self(args);

    cairo_device_type_t type = cairo_device_get_type(device);

    Dart_Handle result = factory_create_device_type(type);

    Dart_SetReturnValue(args, result);
    Dart_ExitScope();
}

void script_create(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);
    const char* fileName = arg_get_string(&args, 1);

    cairo_device_t* device = cairo_script_create(fileName);

    bind_setup(device, obj, device_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void device_status(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_device_t* device = (cairo_device_t*)bind_get_self(args);

    cairo_status_t status = cairo_device_status(device);

    Dart_Handle ret = factory_create_status(status);

    Dart_SetReturnValue(args, ret);
    Dart_ExitScope();
}
