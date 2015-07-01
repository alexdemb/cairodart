#include <cairo/cairo.h>
#include "dart_api.h"

#include "device.h"

void device_destroy(void* handle) {
    if (handle) {
        cairo_device_t* device = (cairo_device_t*) handle;
        if (device) {
            cairo_device_destroy(device);
        }
    }
}
