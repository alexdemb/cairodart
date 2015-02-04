#ifndef CAIRODART_H
#define CAIRODART_H

#include "dart_api.h"
#include "infrastructure/infrastructure.h"
#include "cairo/cairo.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

class CairoDart
{
public:
    static Dart_NativeFunction resolve(std::string& name);

    static void createContext(Dart_NativeArguments args);

    // cairo_surface_t
    static void image_surface_create(Dart_NativeArguments args);
    static void image_surface_get_width(Dart_NativeArguments args);
    static void image_surface_get_height(Dart_NativeArguments args);
    static void image_surface_get_stride(Dart_NativeArguments args);
    static void surface_finish(Dart_NativeArguments args);
    static void surface_flush(Dart_NativeArguments args);
    static void surface_get_content(Dart_NativeArguments args);
    static void surface_mark_dirty(Dart_NativeArguments args);
    static void surface_mark_dirty_rectangle(Dart_NativeArguments args);
    static void surface_get_device_offset(Dart_NativeArguments args);
    static void surface_set_device_offset(Dart_NativeArguments args);
    static void surface_copy_page(Dart_NativeArguments args);
    static void surface_show_page(Dart_NativeArguments args);
    static void surface_supports_mime_type(Dart_NativeArguments args);
    static void surface_has_show_text_glyphs(Dart_NativeArguments args);
    static void surface_get_type(Dart_NativeArguments args);
    static void surface_get_fallback_resolution(Dart_NativeArguments args);
    static void surface_set_fallback_resolution(Dart_NativeArguments args);

    // cairo_format_t
    static void create_cairo_format(Dart_NativeArguments args);
    static void format_stride_for_width(Dart_NativeArguments args);

    // cairo_content_t
    static void create_cairo_content(Dart_NativeArguments args);

    // cairo_surface_type_t
    static void create_cairo_surface_type(Dart_NativeArguments args);
private:
    CairoDart();
};

} // bindings

} // cairodart

#endif // CAIRODART_H
