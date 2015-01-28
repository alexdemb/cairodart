#ifndef CAIRODART_H
#define CAIRODART_H

#include "dart_api.h"
#include "infrastructure/infrastructure.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{

class CairoDart
{
public:
    static Dart_NativeFunction resolve(std::string& name);

    static void createContext(Dart_NativeArguments args);
private:
    CairoDart();
};

} // bindings

} // cairodart

#endif // CAIRODART_H
