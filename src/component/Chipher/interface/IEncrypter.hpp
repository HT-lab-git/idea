#include "types.hpp"

class IEncrypter
{
public:
    virtual ~IEncrypter() = default;
    virtual void encrypt(const u_short (&plaintxt)[4], u_short *cipherTxt) = 0;
};