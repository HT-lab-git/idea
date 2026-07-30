#include "../../interface/IChipher.cuh"
class IIdeaMA;

class IdeaChipher : public IChipher
{
private:
    u_short *_eKey;
    u_short *_dKey;
    const IIdeaMA &_mulInv;
    const IIdeaMA &_mul;
    const IIdeaMA &_add;

public:
    IdeaChipher(const IIdeaMA &mulInv, const IIdeaMA &mul, const IIdeaMA &add, const u_short (&ekey)[52], const u_int (&dkey)[52]);
    void encrypt(const u_short (&plaintxt)[4], u_short *cipherTxt);
    void decrypt(const u_short (&cipherTxt)[4]);
};