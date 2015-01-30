#ifndef CAIROOBJECT_H
#define CAIROOBJECT_H

namespace cairodart
{

namespace bindings
{

class CairoObject
{
public:
    CairoObject();

    virtual void verify() const = 0;
};

} // bindings

} // cairodart

#endif // CAIROOBJECT_H
