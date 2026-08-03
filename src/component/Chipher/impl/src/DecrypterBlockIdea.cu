#include "../include/DecrypterBlockIdea.cuh"
#include "../../../MA/interface/IIdeaMA.cuh"

DecrypterBlockIdea::DecrypterBlockIdea(const IIdeaMA &_mulInv, const IIdeaMA &_mul, const IIdeaMA &_add, const u_short (&_dKey)[52])
    : _mulInv(_mulInv), _mul(_mul), _add(_add), _dKey(_dKey)
{
}
void DecrypterBlockIdea::decrypt(const u_short (&cipherTxt)[4], u_short (&outputPlainTxt)[4])
{
    u_short x1 = cipherTxt[0];
    u_short x2 = cipherTxt[1];
    u_short x3 = cipherTxt[2];
    u_short x4 = cipherTxt[3];

    for (int i = 0; i < 8; i++)
    {
        x1 = _mulInv.calc(x1, _dKey[i * 6]);
        x2 = _add.calc(x2, _dKey[i * 6 + 1]);
        x3 = _add.calc(x3, _dKey[i * 6 + 2]);
        x4 = _mulInv.calc(x4, _dKey[i * 6 + 3]);

        u_short t0 = _mul.calc(x1 ^ x3, _dKey[i * 6 + 4]);
        u_short t1 = _add.calc(t0, x2 ^ x4);
        u_short t2 = _mul.calc(t1, _dKey[i * 6 + 5]);
        u_short t3 = _add.calc(t0, t2);

        x1 ^= t2;
        x3 ^= t2;
        x2 ^= t3;
        x4 ^= t3;
        std::swap(x2, x3);
    }
    outputPlainTxt[0] = _mulInv.calc(x1, _dKey[48]);
    outputPlainTxt[1] = _add.calc(x3, _dKey[49]);
    outputPlainTxt[2] = _add.calc(x2, _dKey[50]);
    outputPlainTxt[3] = _mulInv.calc(x4, _dKey[51]);
}