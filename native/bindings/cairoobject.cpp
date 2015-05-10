#include "cairoobject.h"
#include "infrastructure/infrastructure.h"

using namespace cairodart::infrastructure;

namespace cairodart
{

namespace bindings
{


CairoObject::CairoObject()
{
}

CairoObject::~CairoObject()
{
    BindingObjectCache::getInstance()->remove(this);
}

} // bindings

} // cairodart
