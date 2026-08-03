#include "../../interface/IEncrypter.hpp"
#include "types.hpp"

class IIdeaMA;

class EncrypterBlockIdea : public IEncrypter
{
private:
    const IIdeaMA &_mul;
    const IIdeaMA &_add;
    const u_short (&_eKey)[52];

public:
    EncrypterBlockIdea(const IIdeaMA &mul, const IIdeaMA &add, const u_short (&ekey)[52]);
    void encrypt(const u_short (&plaintxt)[4], u_short *cipherTxt) override;
};
