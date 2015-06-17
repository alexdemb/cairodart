#include <stdlib.h>
#include <string.h>
#include <inttypes.h>
#include <cairo/cairo.h>

#include "dart_api.h"

#include "scaled_font.h"
#include "font_face.h"
#include "argument.h"
#include "bind.h"
#include "factory.h"
#include "error.h"
#include "font_options.h"
#include "matrix.h"
#include "glyphs.h"

void scaled_font_destroy(void* handle) {
    if (handle) {
        cairo_scaled_font_t* font = (cairo_scaled_font_t*) handle;
        if (font) {
            cairo_scaled_font_destroy(font);
        }
    }
}

void scaled_font_create(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle obj = arg_get(&args, 0);
    cairo_font_face_t* fontFace = (cairo_font_face_t*)bind_get(arg_get(&args, 1));
    cairo_matrix_t* fontMatrix = (cairo_matrix_t*)bind_get(arg_get(&args, 2));
    cairo_matrix_t* ctm = (cairo_matrix_t*)bind_get(arg_get(&args, 3));
    cairo_font_options_t* opts = (cairo_font_options_t*)bind_get(arg_get(&args, 4));

    cairo_scaled_font_t* scaledFont = cairo_scaled_font_create(fontFace, fontMatrix, ctm, opts);

    bind_setup(scaledFont, obj, scaled_font_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void scaled_font_extents(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_scaled_font_t* scaledFont = (cairo_scaled_font_t*)bind_get_self(args);

    cairo_font_extents_t extents;

    cairo_scaled_font_extents(scaledFont, &extents);

    Dart_Handle res = factory_create_font_extents(&extents);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void scaled_font_text_extents(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_scaled_font_t* scaledFont = (cairo_scaled_font_t*)bind_get_self(args);
    const char* str = arg_get_string(&args, 1);

    cairo_text_extents_t extents;

    cairo_scaled_font_text_extents(scaledFont, str, &extents);

    Dart_Handle res = factory_create_text_extents(&extents);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void scaled_font_glyph_extents(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_scaled_font_t* scaledFont = (cairo_scaled_font_t*)bind_get_self(args);
    Dart_Handle glyphList = arg_get(&args, 1);
    intptr_t length = 0;
    error_check_handle(Dart_ListLength(glyphList, &length));

    cairo_glyph_t glyphs[length];

    int i = 0;
    for (i = 0; i < length; i++) {
        Dart_Handle glyphObj = Dart_ListGetAt(glyphList, i);
        error_check_handle(glyphObj);
        glyphs[i] = *((cairo_glyph_t*)bind_get(glyphObj));
    }

    cairo_text_extents_t extents;

    cairo_scaled_font_glyph_extents(scaledFont, glyphs, length, &extents);

    Dart_Handle res = factory_create_text_extents(&extents);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void scaled_font_text_to_glyphs(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_scaled_font_t* scaledFont = (cairo_scaled_font_t*)bind_get_self(args);

    double x = arg_get_double(&args, 1);
    double y = arg_get_double(&args, 2);
    const char* utf8 = arg_get_string(&args, 3);
    int utf8len = strlen(utf8);
    cairo_glyph_t* glyphs = NULL;
    int numGlyphs = 0;
    cairo_text_cluster_t* clusters = NULL;
    int numClusters = 0;
    cairo_text_cluster_flags_t flags;

    cairo_status_t status = cairo_scaled_font_text_to_glyphs(
                scaledFont,
                x,
                y,
                utf8,
                utf8len,
                &glyphs,
                &numGlyphs,
                &clusters,
                &numClusters,
                &flags);

    error_verify(status);

    Glyphs* g = glyphs_create(glyphs, clusters);

    Dart_Handle res = factory_create_glyphs(g, numGlyphs, numClusters, flags);

    bind_setup(g, res, glyphs_destroy);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void scaled_font_get_font_face(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_scaled_font_t* scaledFont = (cairo_scaled_font_t*)bind_get_self(args);

    cairo_font_face_t* fontFace = cairo_scaled_font_get_font_face(scaledFont);

    fontFace = cairo_font_face_reference(fontFace);

    Dart_Handle res = factory_create_object("FontFace", "_internal", NULL, 0);
    bind_setup(fontFace, res, font_face_destroy);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void scaled_font_get_font_options(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_scaled_font_t* scaledFont = (cairo_scaled_font_t*)bind_get_self(args);

    cairo_font_options_t* opts = cairo_font_options_create();
    cairo_scaled_font_get_font_options(scaledFont, opts);

    Dart_Handle res = factory_create_object("FontOptions", "_internal", NULL, 0);

    bind_setup(opts, res, font_options_destroy);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void scaled_font_get_font_matrix(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_scaled_font_t* scaledFont = (cairo_scaled_font_t*)bind_get_self(args);

    cairo_matrix_t* matrix = (cairo_matrix_t*) malloc(sizeof(cairo_matrix_t));
    cairo_scaled_font_get_font_matrix(scaledFont, matrix);

    Dart_Handle res = factory_create_matrix();

    bind_setup(matrix, res, matrix_destroy);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void scaled_font_get_ctm(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_scaled_font_t* scaledFont = (cairo_scaled_font_t*)bind_get_self(args);

    cairo_matrix_t* matrix = (cairo_matrix_t*) malloc(sizeof(cairo_matrix_t));
    cairo_scaled_font_get_ctm(scaledFont, matrix);

    Dart_Handle res = factory_create_matrix();

    bind_setup(matrix, res, matrix_destroy);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void scaled_font_get_scale_matrix(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_scaled_font_t* scaledFont = (cairo_scaled_font_t*)bind_get_self(args);

    cairo_matrix_t* matrix = (cairo_matrix_t*) malloc(sizeof(cairo_matrix_t));
    cairo_scaled_font_get_scale_matrix(scaledFont, matrix);

    Dart_Handle res = factory_create_matrix();

    bind_setup(matrix, res, matrix_destroy);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void scaled_font_get_type(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_scaled_font_t* scaledFont = (cairo_scaled_font_t*)bind_get_self(args);

    cairo_font_type_t type = cairo_scaled_font_get_type(scaledFont);

    Dart_Handle res = factory_create_font_type(type);

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}
