#include <stdlib.h>
#include <stdint.h>

#include "argument.h"
#include "bind.h"
#include "error.h"

struct _BindInfo {
    void* handle;
    DestroyFunc destroy_func;
};

typedef struct _BindInfo BindInfo;

static void finalize(void* isolateCallbackData, Dart_WeakPersistentHandle weakHandle, void* peer);

void bind_setup(void* obj, Dart_Handle handle, DestroyFunc destroy_func) {
    BindInfo* info = (BindInfo*) malloc(sizeof(BindInfo));
    info->handle = obj;
    info->destroy_func = destroy_func;

    error_check_handle(Dart_SetNativeInstanceField(handle, 0, (intptr_t) info));
    Dart_NewWeakPersistentHandle(handle, (void*) info, 0, finalize);
}

void* bind_get(Dart_Handle handle) {
    intptr_t ptr;
    error_check_handle(Dart_GetNativeInstanceField(handle, 0, &ptr));
    BindInfo* info = (BindInfo*) ptr;
    if (info)
        return info->handle;

    return NULL;
}

void* bind_get_self(Dart_NativeArguments args) {
    Dart_Handle self = Dart_GetNativeArgument(args, 0);
    return bind_get(self);
}


static void finalize(void* isolateCallbackData, Dart_WeakPersistentHandle weakHandle, void* peer) {
    UNUSED(isolateCallbackData);
    UNUSED(weakHandle);

    BindInfo* info = (BindInfo*)peer;
    if (info && info->handle && info->destroy_func) {
        info->destroy_func(info->handle);
    }
}
