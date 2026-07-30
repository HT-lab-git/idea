#include "../../interface/IChipher.cuh"

class IdeaChipher : public IChipher
{
private:
    u_short *_plaintxt;
    u_short _chiphertxt[4];
    u_short *_eKey;
    u_short *_dKey;

public:
    IdeaChipher(const u_short (&plaintxt)[4], const u_short (&ekey)[52], const u_int (&dkey)[52]);
    void encrypt();
    void decrypt();
};