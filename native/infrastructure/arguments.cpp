#include "arguments.h"
#include "utils.h"
#include "dart_api.h"

namespace cairodart
{

namespace infrastructure
{


Arguments::~Arguments()
{
    this->args = nullptr;
}

Arguments::Arguments(Dart_NativeArguments& args) : args(args)
{
}

Dart_Handle Arguments::arg(const int& pos) const
{
    Dart_Handle result = Dart_GetNativeArgument(args, pos);
    Utils::propagateError(result);
    return result;
}

bool Arguments::boolArg(const int& pos) const
{
    return Utils::toBoolean(arg(pos));
}

int64_t Arguments::intArg(const int& pos) const
{
    return Utils::toInteger(arg(pos));
}

std::string Arguments::stringArg(const int &pos) const
{
    return Utils::toString(arg(pos));
}

double Arguments::doubleArg(const int &pos) const
{
    return Utils::toDouble(arg(pos));
}

} // infrastructure

} // cairodart

