#ifndef PATH_H
#define PATH_H

typedef struct _PathIterator {
  cairo_path_t* path;
  int idx;
} PathIterator;

void path_destroy(void* handle);

void create_path_iterator(Dart_NativeArguments args);
void path_element_get_type(Dart_NativeArguments args);
void path_element_get_point(Dart_NativeArguments args);
void path_iterator_move_next(Dart_NativeArguments args);
void path_iterator_current(Dart_NativeArguments args);

#endif // PATH_H
