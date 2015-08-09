#include <stdlib.h>
#include <cairo/cairo.h>

#include "dart_api.h"
#include "argument.h"
#include "factory.h"
#include "bind.h"

#include "path.h"
#include "error.h"

static void path_iterator_destroy(void* handle) {
    if (handle) {
        PathIterator* pathIter = (PathIterator*) handle;
        if (pathIter) {
            free(pathIter);
        }
    }
}

static void path_data_destroy(void* handle) {
    if (handle) {
        cairo_path_data_t* data = (cairo_path_data_t*) handle;
        if (data) {
            free(data);
        }
    }
}

void path_destroy(void* handle) {
    if (handle) {
        cairo_path_t* path = (cairo_path_t*) handle;
        if (path) {
            cairo_path_destroy(path);
        }
    }
}

void create_path_iterator(Dart_NativeArguments args) {
    Dart_EnterScope();
    Dart_Handle iterObj = arg_get(&args, 0);
    Dart_Handle pathObj = arg_get(&args, 1);
    cairo_path_t* path = (cairo_path_t*) bind_get(pathObj);

    PathIterator* iter = (PathIterator*) malloc(sizeof(PathIterator));
    iter->path = path;
    iter->idx = -1;

    bind_setup(iter, iterObj, path_iterator_destroy);

    Dart_SetReturnValue(args, Dart_Null());
    Dart_ExitScope();
}

void path_element_get_type(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_path_data_t* data = (cairo_path_data_t*) bind_get_self(args);

    cairo_path_data_type_t type = data->header.type;

    Dart_Handle pathElementType = factory_create_path_element_type(type);

    Dart_SetReturnValue(args, pathElementType);
    Dart_ExitScope();
}

void path_element_get_point(Dart_NativeArguments args) {
    Dart_EnterScope();
    cairo_path_data_t* data = (cairo_path_data_t*) bind_get_self(args);

    Dart_Handle point = factory_create_point(data->point.x, data->point.y);

    Dart_SetReturnValue(args, point);
    Dart_ExitScope();
}

void path_iterator_move_next(Dart_NativeArguments args) {
    Dart_EnterScope();
    PathIterator* iter = (PathIterator*) bind_get_self(args);

    int offset = iter->idx < 0 ? 0 : iter->idx + iter->path->data[iter->idx].header.length;

    Dart_Handle res;
    if ((iter->idx + offset) < iter->path->num_data) {
        res = Dart_NewBoolean(true);
        iter->idx = iter->idx < 0 ? 0 : iter->idx + offset;
    } else {
        res = Dart_NewBoolean(false);
    }

    Dart_SetReturnValue(args, res);
    Dart_ExitScope();
}

void path_iterator_current(Dart_NativeArguments args) {
    Dart_EnterScope();
    PathIterator* iter = (PathIterator*) bind_get_self(args);

    if (iter->idx < 0) {
        error_throw("Uninitialized iterator. Call moveNext() first.", 0);
    }

    cairo_path_data_t pathData = iter->path->data[iter->idx];
    cairo_path_data_t* res = (cairo_path_data_t*)malloc(sizeof(cairo_path_data_t));

    *res = pathData;

    Dart_Handle pathElement = factory_create_object("_PathElement", "internal", NULL, 0);

    bind_setup(res, pathElement, path_data_destroy);

    Dart_SetReturnValue(args, pathElement);
    Dart_ExitScope();
}
