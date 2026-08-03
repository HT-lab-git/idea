#include "../../interface/IKeyGen.hpp"
class IIdeaMA;

class IdeaKeyGen : public IKeyGen
{
private:
    const u_short (&_key)[8];
    u_short _eKey[52];
    u_short _dKey[52];
    IIdeaMA &_mulInv;

public:
    IdeaKeyGen(IIdeaMA &ideaMulInv, const u_short (&key)[8], const u_short (&ekey)[52], const u_short (&dkey)[52]);
    void generate() override;
    u_short *getEKey();
    u_short *getDKey();
};