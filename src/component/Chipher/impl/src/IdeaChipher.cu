#include "../include/IdeaChipher.cuh"
#include "../../../MA/interface/IIdeaMA.cuh"

IdeaChipher::IdeaChipher(const IIdeaMA &mulInv, const IIdeaMA &mul, const IIdeaMA &add, const u_short (&ekey)[52], const u_int (&dkey)[52]) : _mulInv(mulInv), _mul(mul), _add(add)
{

    _eKey = new u_short[52];
    for (int i = 0; i < 52; i++)
    {
        _eKey[i] = ekey[i]; // 52個の暗号化鍵を格納する配列(0~47までは8段目までの暗号化鍵、48~51までは最終段の暗号化鍵)
    }

    _dKey = new u_short[52];
    for (int i = 0; i < 52; i++)
    {
        _dKey[i] = dkey[i]; // 52個の復号化鍵を格納する配列(0~47までは8段目までの復号化鍵、48~51までは最終段の復号化鍵)
    }
}

void IdeaChipher::encrypt(const u_short (&plaintxt)[4], u_short *cipherTxt)
{
}
void IdeaChipher::decrypt(const u_short (&cipherTxt)[4])
{
}