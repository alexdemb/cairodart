#ifndef ARGUMENTS_H
#define ARGUMENTS_H

#include <string>
#include "dart_api.h"

namespace cairodart
{

namespace infrastructure
{

class Arguments
{
private:
    Dart_NativeArguments& args;
public:
    Arguments(Dart_NativeArguments& args);
    virtual ~Arguments();

    Dart_Handle arg(const int& pos) const;
    bool boolArg(const int& pos) const;
    std::string stringArg(const int& pos) const;
    int64_t intArg(const int& pos) const;
    double doubleArg(const int& pos) const;



};

} // infrastructure

} // cairodart


#endif // ARGUMENTS_H
