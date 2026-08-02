#include "../include/MultiplicationInv.cuh"
u_short MultiplicationInv::calc(const u_short &x) const
{

    int u, v, w;
    int t1, t2, t3;
    int u1, u2, u3;
    int v1, v2, v3;
    u = (int)x, v = 0x10001;
    u1 = 1, u2 = u, u3 = 0;
    v1 = 0, v2 = v, v3 = 1;
    while (v2)
    {
        w = u2 / v2;
        t1 = u1 - v1 * w;
        t2 = u2 - v2 * w;
        t3 = u3 - v3 * w;
        u1 = v1, u2 = v2, u3 = v3;
        v1 = t1, v2 = t2, v3 = t3;
    }
    if (u1 < 0)
        u1 = u1 + 0x10001;
    return u1 & 0xFFFF;
}