#include "../include/IdeaKeyGen.hpp"
#include "../../../MA/interface/IIdeaMA.hpp"
#include <iostream>

IdeaKeyGen::IdeaKeyGen(IIdeaMA &ideaMulInv, const u_short (&key)[8])
    : _mulInv(ideaMulInv), _key(key)
{
}
void IdeaKeyGen::generate()
{
    int i, j;
    // 暗号化鍵
    std::cout << "--暗号鍵--\n";
    for (int i = 0; i < 52; ++i)
    {
        if (i < 8)
        {
            _eKey[i] = _key[i];
        }
        else
        {
            _eKey[i] = static_cast<u_short>(
                (_eKey[(i + 1) & 0x7 ? i - 7 : i - 15] << 9) |
                (_eKey[((i + 2) & 0x7) < 2 ? i - 14 : i - 6] >> 7));
        }
        std::cout << std::hex << _eKey[i];
    }
    std::cout << "\n"
              << std::endl;
    // 復号化鍵
    std::cout << "--復号副鍵--\n";
    _dKey[48] = _mulInv.calc(_eKey[0]);
    _dKey[49] = -_eKey[1];
    _dKey[50] = -_eKey[2];
    _dKey[51] = _mulInv.calc(_eKey[3]);

    for (i = 42, j = 4; i >= 0; i = i - 6, j = j + 6)
    {
        _dKey[i + 4] = _eKey[j + 0];
        _dKey[i + 5] = _eKey[j + 1];
        _dKey[i + 0] = _mulInv.calc(_eKey[j + 2]);

        if (i)
        {
            _dKey[i + 2] = -_eKey[j + 3];
            _dKey[i + 1] = -_eKey[j + 4];
        }
        else
        {
            _dKey[1] = -_eKey[49];
            _dKey[2] = -_eKey[50];
        }
        _dKey[i + 3] = _mulInv.calc(_eKey[j + 5]);
    }
    for (i = 0; i <= 52; i++)
    {
        std::cout << std::hex << _dKey[i];
    }

    std::cout << "\n"
              << std::endl;
}

u_short *IdeaKeyGen::getDKey()
{
    return _dKey;
}

u_short *IdeaKeyGen::getEKey()
{
    return _eKey;
}