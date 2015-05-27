#include "library.h"

static Dart_Handle lib;

Dart_Handle library_get() {
   return lib;
}

void library_set(Dart_Handle library) {
   lib = library;
}

