#include "types.hpp"

class IKeyGen
{
public:
    virtual ~IKeyGen() = default;
    virtual void generate() = 0;
};