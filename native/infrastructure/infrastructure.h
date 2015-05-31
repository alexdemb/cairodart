#ifndef INFRASTRUCTURE_H
#define INFRASTRUCTURE_H

#include "dart_api.h"

#define UNUSED(expr) (void)(expr);;

namespace cairodart
{

namespace infrastructure
{
    Dart_Handle getLibrary();
}

}



#include "utils.h"
#include "bindingobjectcache.h"

#endif // INFRASTRUCTURE_H
