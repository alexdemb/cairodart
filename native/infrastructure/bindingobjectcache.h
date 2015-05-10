#ifndef BINDINGOBJECTCACHE_H
#define BINDINGOBJECTCACHE_H

#include <map>
#include "bindings/cairoobject.h"

using namespace std;
using namespace cairodart::bindings;

namespace cairodart
{

namespace infrastructure
{

typedef map<const void*, const CairoObject*> CacheMap;

class BindingObjectCache final
{
private:
    CacheMap cache;

    BindingObjectCache();

    ~BindingObjectCache();

    static BindingObjectCache* instance;

    CacheMap::const_iterator findByValue(const CairoObject* bindingObject) const;
public:

    static BindingObjectCache* getInstance();


    void add(const void* cairoHandler, const CairoObject* bindingObject);
    void remove(const CairoObject* bindingObject);
    void remove(const void* cairoHandle);
    const CairoObject* get(const void* cairoHandler) const;
    bool has(const void* cairoHandler) const;
    bool has(const CairoObject* bindingObject) const;

};

} // infrastructure

} // cairodart

#endif // BINDINGOBJECTCACHE_H
