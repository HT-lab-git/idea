#include "../../interface/IEncrypter.cuh"
#include "../../../../types.cuh"

class IIdeaMA;

class EncrypterBlockIdea : public IEncrypter
{
private:
    const IIdeaMA &_mulInv;
    const IIdeaMA &_mul;
    const IIdeaMA &_add;
    const u_short (&_eKey)[52];

public:
    EncrypterBlockIdea(const IIdeaMA &mulInv, const IIdeaMA &mul, const IIdeaMA &add, const u_short (&ekey)[52]);
    void encrypt(const u_short (&plaintxt)[4], u_short *cipherTxt) override;
};
