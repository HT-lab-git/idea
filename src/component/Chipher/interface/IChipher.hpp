#include "types.hpp"

class IIdeaMA;

class IChipher
{
public:
    virtual ~IChipher() = default;
    virtual void Chipher(const IIdeaMA &_mulInv, const IIdeaMA &_mul, const IIdeaMA &_add, const u_short (&_dKey)[52]) = 0;
};