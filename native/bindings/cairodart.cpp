#include "cairodart.h"
#include <map>

namespace cairodart
{

namespace bindings
{

static std::map<std::string, Dart_NativeFunction> FUNCTIONS_MAP =
{
  { "createContext", CairoDart::createContext }
};



CairoDart::CairoDart()
{
}

Dart_NativeFunction CairoDart::resolve(std::string& name)
{
    auto iter = FUNCTIONS_MAP.find(name);
    if (iter == FUNCTIONS_MAP.end())
        return NULL;

    return iter->second;
}

void CairoDart::createContext(Dart_NativeArguments args)
{
    UNUSED(args) //temporary
}

} // bindings

} // cairodart
