#ifndef FACTORY_H
#define FACTORY_H

#include "dart_api.h"
#include "glyphs.h"
#include <cairo/cairo.h>
#include <cairo/cairo-pdf.h>
#include <cairo/cairo-ps.h>
#include <cairo/cairo-svg.h>

Dart_Handle factory_create_object(const char* className, const char* ctorName, Dart_Handle* args, int argc);

Dart_Handle factory_create_point(const double x, const double y);

Dart_Handle factory_create_distance(const double dx, const double dy);

Dart_Handle factory_create_rectangle(const int x, const int y, const int width, const int height);

Dart_Handle factory_create_rectangle_double(const double x, const double y, const double width, const double height);

Dart_Handle factory_create_resolution(const double xRes, const double yRes);

Dart_Handle factory_create_color(const double red, const double green, const double blue, const double alpha);

Dart_Handle factory_create_color_stop(Dart_Handle color, double offset);

Dart_Handle factory_create_circle(const double x, const double y, const double radius);

Dart_Handle factory_create_matrix();

Dart_Handle factory_create_line_cap(cairo_line_cap_t cap);

Dart_Handle factory_create_line_joint(cairo_line_join_t joint);

Dart_Handle factory_create_operator(cairo_operator_t op);

Dart_Handle factory_create_fill_rule(cairo_fill_rule_t rule);

Dart_Handle factory_create_antialias(cairo_antialias_t antialias);

Dart_Handle factory_create_subpixel_order(cairo_subpixel_order_t order);

Dart_Handle factory_create_hint_style(cairo_hint_style_t style);

Dart_Handle factory_create_hint_metrics(cairo_hint_metrics_t metrics);

Dart_Handle factory_create_rectangle_list(const Dart_Handle context, const cairo_rectangle_list_t* list);

Dart_Handle factory_create_pattern(cairo_pattern_t* pattern);

Dart_Handle factory_create_surface(cairo_surface_t* surface);

Dart_Handle factory_create_font_type(cairo_font_type_t fontType);

Dart_Handle factory_create_font_extents(const cairo_font_extents_t* extents);

Dart_Handle factory_create_text_extents(const cairo_text_extents_t* extents);

Dart_Handle factory_create_glyphs(Glyphs* glyphs, int glyphNum, int clusterNum, cairo_text_cluster_flags_t flags);

Dart_Handle factory_create_pdf_version(cairo_pdf_version_t version);

Dart_Handle factory_create_ps_level(cairo_ps_level_t level);

Dart_Handle factory_create_svg_version(cairo_svg_version_t version);

Dart_Handle factory_create_device_type(cairo_device_type_t type);

Dart_Handle factory_create_status(cairo_status_t status);

#endif // FACTORY_H
