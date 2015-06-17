#include <stdlib.h>
#include <cairo/cairo.h>
#include "glyphs.h"

Glyphs* glyphs_create(cairo_glyph_t* glyphs, cairo_text_cluster_t* clusters) {
    Glyphs* obj = (Glyphs*)malloc(sizeof(Glyphs));
    obj->glyphs = glyphs;
    obj->clusters = clusters;
    return obj;
}

void glyphs_destroy(void* handle) {
    if (!handle)
       return;

    Glyphs* glyphs = (Glyphs*)handle;

    if (glyphs) {
        cairo_glyph_free(glyphs->glyphs);
        cairo_text_cluster_free(glyphs->clusters);
        free(glyphs);
    }
}
