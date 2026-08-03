#include "../../interface/IDecrypter.hpp"
#include "types.hpp"

class IIdeaMA;

class DecrypterBlockIdea : public IDecrypter
{
private:
    const IIdeaMA &_mulInv;
    const IIdeaMA &_mul;
    const IIdeaMA &_add;
    const u_short (&_dKey)[52];

public:
    DecrypterBlockIdea(const IIdeaMA &mulInv, const IIdeaMA &mul, const IIdeaMA &add, const u_short (&dKey)[52]);
    void decrypt(const u_short (&cipherTxt)[4], u_short (&outputPlainTxt)[4]) override;
};