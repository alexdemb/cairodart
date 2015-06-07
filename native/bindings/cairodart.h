#ifndef CAIRODART_H
#define CAIRODART_H

#include "dart_api.h"

#ifdef __cplusplus
extern "C" {
#endif

Dart_NativeFunction resolve(const char* name);




// cairo_format_t
void format_stride_for_width(Dart_NativeArguments args);

#ifdef __cplusplus
} // extern "C"
#endif


#endif // CAIRODART_H
