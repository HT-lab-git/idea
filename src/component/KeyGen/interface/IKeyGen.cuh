#include "../../../types.cuh"

class IKeyGen
{
public:
    virtual ~IKeyGen() = default;
    virtual void generate() = 0;
};