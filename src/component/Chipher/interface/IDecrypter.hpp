#include "types.hpp"

class IDecrypter
{
public:
    virtual ~IDecrypter() = default;
    virtual void decrypt(const u_short (&cipherTxt)[4], u_short (&outputPlainTxt)[4]) = 0;
};