#include "../../../types.cuh"

class IChipher
{
    virtual ~IChipher() = default;
    virtual void enCrypt() = 0;
    virtual void deCtypt() = 0;
};