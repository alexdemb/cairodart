#include <stdint.h>
#include "list.h"
#include "error.h"


int list_length(Dart_Handle list) {
    intptr_t length = 0;
    error_check_handle(Dart_ListLength(list, &length));
    return (int)length;
}

int list_int_at(Dart_Handle list, int idx) {
    Dart_Handle handle = Dart_ListGetAt(list, idx);
    error_check_handle(handle);
    int64_t val = 0;
    Dart_IntegerToInt64(handle, &val);
    return (int)val;
}
