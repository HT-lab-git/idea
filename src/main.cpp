#include <stdio.h>
#include <iostream>
#include <algorithm>
#include <cstring>
#include "./types.hpp"
#include "./component/factory.hpp"

int main(void)
{
    u_short input[4], output[4], tete[4];
    u_short ekey[52], dkey[52], key[8], getChipher[100];
    char getkey[18], getTxt[100];

    MultiplicationInv mulInvImpl = MultiplicationInv();
    Multiplication mulImpl = Multiplication();
    Addition addImpl = Addition();
    IIdeaMA &mulInv = mulInvImpl;
    IIdeaMA &mul = mulImpl;
    IIdeaMA &add = addImpl;

    std::cout << "-----Please input key:-----" << std::endl;
    std::fill_n(key, 8, 0);
    std::fill_n(getTxt, 100, '\0');

    std::cin.getline(getkey, 18);

    for (int i = 0, j = 0; i < 8; ++i, j += 2)
    {
        key[i] = static_cast<u_short>((static_cast<unsigned char>(getkey[j]) << 8) | static_cast<unsigned char>(getkey[j + 1]));
    }

    IdeaKeyGen keyGen = IdeaKeyGen(mulInv, key);
    keyGen.generate();
    std::copy(keyGen.getEKey(), keyGen.getEKey() + 52, ekey);
    std::copy(keyGen.getDKey(), keyGen.getDKey() + 52, dkey);

    std::cout << "-----Please input plaintext:-----" << std::endl;
    std::cin.getline(getTxt, 100);
    std::cout << std::endl;

    std::cout << "-----plaintext:-----" << std::endl;
    std::cout << getTxt << std::endl;
    std::cout << std::endl;

    EncrypterBlockIdea encrypterBlockIdea = EncrypterBlockIdea(mul, add, ekey);
    DecrypterBlockIdea decrypterBlockIdea = DecrypterBlockIdea(mulInv, mul, add, dkey);

    int cipherCount = 0;
    std::cout << "-----ciphertext:-----" << std::endl;
    const std::size_t plaintextLength = std::strlen(getTxt);

    for (std::size_t blockIndex = 0; blockIndex < plaintextLength; blockIndex += 4)
    {
        for (int j = 0; j < 4; ++j)
        {
            input[j] = 0;
            if (blockIndex + j < plaintextLength)
            {
                input[j] = static_cast<unsigned char>(getTxt[blockIndex + j]);
            }
        }

        encrypterBlockIdea.encrypt(input, output);

        for (int j = 0; j < 4; ++j)
        {
            getChipher[cipherCount++] = output[j];
            std::cout << std::hex << output[j];
        }
    }

    std::cout << std::endl
              << std::endl;

    std::cout << "-----decrypted text:-----" << std::endl;
    for (int blockStart = 0; blockStart < cipherCount; blockStart += 4)
    {
        output[0] = getChipher[blockStart];
        output[1] = getChipher[blockStart + 1];
        output[2] = getChipher[blockStart + 2];
        output[3] = getChipher[blockStart + 3];

        decrypterBlockIdea.decrypt(output, tete);

        for (int j = 0; j < 4; ++j)
        {
            std::cout << static_cast<char>(tete[j]);
        }
    }

    std::cout << std::endl;

    return 0;
}