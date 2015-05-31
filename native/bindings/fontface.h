#ifndef FONTFACE_H
#define FONTFACE_H

#include "cairodart.h"
#include "cairoobject.h"
#include <cairo/cairo.h>

namespace cairodart
{

namespace bindings
{

class FontFace : public CairoObject
{
private:
    cairo_font_face_t* fontFace;
public:
    static FontFace* create(cairo_font_face_t* handle);

    virtual ~FontFace();

    FontFace(cairo_font_face_t* handle);

    cairo_font_type_t getType() const;

    void verify() const;


};

}

}

#endif // FONTFACE_H
