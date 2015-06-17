#ifndef GLYPHS_H
#define GLYPHS_H

#include <cairo/cairo.h>

struct _Glyphs {
    cairo_glyph_t* glyphs;
    cairo_text_cluster_t* clusters;
};

typedef struct _Glyphs Glyphs;

Glyphs* glyphs_create(cairo_glyph_t* glyphs, cairo_text_cluster_t* clusters);
void glyphs_destroy(void*);

#endif // GLYPHS_H
