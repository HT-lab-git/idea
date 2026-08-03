#include "../include/EncrypterBlockIdea.hpp"
#include "../../../MA/interface/IIdeaMA.hpp"
#include <utility>
#include <iostream>

EncrypterBlockIdea::EncrypterBlockIdea(const IIdeaMA &mul, const IIdeaMA &add, const u_short (&ekey)[52])
    : IEncrypter(), _mul(mul), _add(add), _eKey(ekey) {}

void EncrypterBlockIdea::encrypt(const u_short (&plaintxt)[4], u_short *cipherTxt)
{
    u_short x1 = plaintxt[0];
    u_short x2 = plaintxt[1];
    u_short x3 = plaintxt[2];
    u_short x4 = plaintxt[3];

    for (int i = 0; i < 8; ++i)
    {
        x1 = _mul.calc(x1, _eKey[i * 6]);
        x2 = _add.calc(x2, _eKey[i * 6 + 1]);
        x3 = _add.calc(x3, _eKey[i * 6 + 2]);
        x4 = _mul.calc(x4, _eKey[i * 6 + 3]);

        u_short t0 = _mul.calc(x1 ^ x3, _eKey[i * 6 + 4]);
        u_short t1 = _add.calc(t0, x2 ^ x4);
        u_short t2 = _mul.calc(t1, _eKey[i * 6 + 5]);
        u_short t3 = _add.calc(t0, t2);

        x1 ^= t2;
        x3 ^= t2;
        x2 ^= t3;
        x4 ^= t3;
        std::swap(x2, x3);
    }

    cipherTxt[0] = _mul.calc(x1, _eKey[48]);
    cipherTxt[1] = _add.calc(x3, _eKey[49]);
    cipherTxt[2] = _add.calc(x2, _eKey[50]);
    cipherTxt[3] = _mul.calc(x4, _eKey[51]);
}