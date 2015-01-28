#ifndef OBJECT_H
#define OBJECT_H

#include "dart_api.h"

namespace cairodart
{

namespace infrastructure
{

template<typename T>
class Object
{
private:
    Object();


    Dart_Handle handle;
protected:
    Object(const Dart_Handle& handle);

    Dart_Handle getHandle() const;

    T value;
public:
    virtual ~Object();

    T getValue() const;
};

} // infrastructure

} // cairodart

#endif // OBJECT_H
