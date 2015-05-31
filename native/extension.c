#include <stdlib.h>
#include "dart_api.h"
#include "bindings/cairodart.h"
#include "library.h"
#include "argument.h"
#include "error.h"

Dart_NativeFunction ResolveName(Dart_Handle name, int argc, bool* auto_setup_scope);

DART_EXPORT Dart_Handle cairodart_Init(Dart_Handle parent_library) {
    if (Dart_IsError(parent_library))
        return parent_library;

    Dart_Handle result_code = Dart_SetNativeResolver(parent_library, ResolveName, NULL);
    if (Dart_IsError(result_code))
        return result_code;

    Dart_Handle lib = Dart_NewPersistentHandle(parent_library);
    library_set(lib);
    return Dart_Null();
}

Dart_NativeFunction ResolveName(Dart_Handle name, int argc, bool* auto_setup_scope) {
    UNUSED(argc)
    UNUSED(auto_setup_scope)

    if (!Dart_IsString(name))
        return NULL;

    Dart_NativeFunction result = NULL;

    const char* funcName;
    error_check_handle(Dart_StringToCString(name, &funcName));

    result = resolve(funcName);
    return result;
}
