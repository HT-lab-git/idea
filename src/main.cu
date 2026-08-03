#include <stdio.h>
#include <iostream>
#include "./types.cuh"
#include "./component/factory.cuh"

int main(void)
{
    int i, j, k;
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

    for (int i = 0; i < 18; i++)
    {
        key[i] = '\0';
    }
    for (int i = 0; i < 100; i++)
    {
        getTxt[i] = '\0';
    }

    std::cin.getline(getkey, 18);

    for (i = 0, j = 0; i < 8; i++, j += 2)
    {
        key[i] = (getkey[j] << 8) | getkey[j + 1];
    }
    std::cout << "\n"
              << std::endl;
    /*副鍵の生成*/
    IdeaKeyGen keyGen = IdeaKeyGen(mulInv, key, ekey, dkey);

    std::cout << "-----Please input plaintext:-----" << std::endl;

    std::cin.getline(getTxt, 100);
    std::cout << "\n"
              << std::endl;

    std::cout << "-----plaintxt:-----\n"
              << std::endl;

    for (i = 0; i < 100; i++)
    {
        std::cout << getTxt[i];
    }
    std::cout << "\n"
              << std::endl;

    /*暗号化、復号化処理用のインスタンスを生成*/
    EncrypterBlockIdea encrypterBlockIdea = EncrypterBlockIdea(mulInv, mul, add, ekey);
    DecrypterBlockIdea decrypterBlockIdea = DecrypterBlockIdea(mulInv, mul, add, dkey);
    /*暗号化処理*/
    k = 0;

    std::cout << "-----ciphertext:-----\n"
              << std::endl;

    for (i = 0; i < 100; i += 4)
    {
        for (j = 0; j < 4; j++)
        {
            input[j] = (getTxt[i + j * 2] << 8) | getTxt[i + j * 2 + 1];
        }
        encrypterBlockIdea.encrypt((const u_short(&)[4])input, output);

        for (j = 0; j < 4; j++)
        {
            getChipher[k] = output[j];
            k++;
            std::cout << std::hex << output[j] << " ";
        }
    }

    std::cout << "\n"
              << std::endl;

    /*復号化処理*/

    std::cout << "-----decrypted text:-----\n"
              << std::endl;

    for (i = 0; i < 100; i += 4)
    {
        for (j = 0; j < 4; j++)
        {
            input[j] = getChipher[i + j];
        }
        decrypterBlockIdea.decrypt((const u_short(&)[4])input, output);

        for (j = 0; j < 4; j++)
        {
            tete[j] = output[j];
            std::cout << std::hex << output[j] << " ";
        }
    }

    std::cout << "\n"
              << std::endl;

    return 0;
}