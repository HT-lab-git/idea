#include "../../interface/IDecrypter.cuh"
#include "../../../../types.cuh"

class IIdeaMA;

class DecrypterBlockIdea : public IDecrypter
{
private:
    const IIdeaMA &_mulInv;
    const IIdeaMA &_mul;
    const IIdeaMA &_add;
    const u_short (&_dKey)[52];

public:
    DecrypterBlockIdea(const IIdeaMA &_mulInv, const IIdeaMA &_mul, const IIdeaMA &_add, const u_short (&_dKey)[52]);
    void decrypt(const u_short (&cipherTxt)[4], u_short (&outputPlainTxt)[4]) override;
};