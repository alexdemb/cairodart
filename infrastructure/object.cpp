#include "object.h"

namespace cairodart
{

namespace infrastructure
{

template<typename T>
Object<T>::Object()
{
}

template<typename T>
Object<T>::~Object()
{
}

template<typename T>
Object<T>::Object(const Dart_Handle& handle)
{
    this->handle = handle;
}

template<typename T>
T Object<T>::getValue() const
{
    return this->value;
}

template<typename T>
Dart_Handle Object<T>::getHandle() const
{
    return this->handle;
}

} // infrastructure

} // cairodart
