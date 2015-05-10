#include "fontface.h"
#include "infrastructure/infrastructure.h"

FontFace* FontFace::create(cairo_font_face_t *handle)
{
    FontFace* face = new FontFace(handle);
    BindingObjectCache::getInstance()->add(handle, face);
    return face;
}

FontFace::FontFace(cairo_font_face_t* handle)
{
    this->fontFace = handle;
}


FontFace::~FontFace()
{
    if (fontFace)
    {
        cairo_font_face_destroy(fontFace);
        fontFace = nullptr;
    }
}

cairo_font_type_t FontFace::getType() const
{
    cairo_font_type_t type = cairo_font_face_get_type(fontFace);
    verify();
    return type;
}

void FontFace::verify() const
{
    cairo_status_t status = cairo_font_face_status(fontFace);
    Utils::verify(status);
}
