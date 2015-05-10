#include "bindingobjectcache.h"
#include <algorithm>
#include <functional>

using namespace std;

namespace cairodart
{


namespace infrastructure
{

BindingObjectCache* BindingObjectCache::instance = nullptr;

typedef std::pair<const void*, const CairoObject*> CacheEntry;

BindingObjectCache::BindingObjectCache()
{
}

BindingObjectCache::~BindingObjectCache()
{
}

BindingObjectCache* BindingObjectCache::getInstance()
{
    if (instance == nullptr)
    {
        instance = new BindingObjectCache();
    }


    return instance;
}

void BindingObjectCache::add(const void *cairoHandler, const CairoObject *bindingObject)
{
    cache[cairoHandler] = bindingObject;
}

void BindingObjectCache::remove(const CairoObject *bindingObject)
{
    auto found = findByValue(bindingObject);

    if (found != cache.end())
    {
        cache.erase(found);
    }
}

void BindingObjectCache::remove(const void *cairoHandle)
{
    cache.erase(cairoHandle);
}

const CairoObject* BindingObjectCache::get(const void *cairoHandler) const
{
    auto found = cache.find(cairoHandler);
    if (found != cache.end())
    {
        return found->second;
    }

    return nullptr;
}


bool BindingObjectCache::has(const CairoObject *bindingObject) const
{
    return findByValue(bindingObject) != cache.end();
}

bool BindingObjectCache::has(const void *cairoHandler) const
{
    return cache.find(cairoHandler) != cache.end();
}

CacheMap::const_iterator BindingObjectCache::findByValue(const CairoObject* bindingObject) const
{
    return find_if(cache.begin(), cache.end(), [=](CacheEntry entry) { return entry.second == bindingObject; });
}

} // infrastructure

} // cairodart
