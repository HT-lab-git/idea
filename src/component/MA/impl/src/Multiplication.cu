#include "../include/Multiplication.cuh"

u_short Multiplication::calc(const u_short &x, const u_short &y)
{
    u_short t;
    u_short u, v;
    if (!x)
        return 1 - y;
    if (!y)
        return 1 - x;
    t = x * y;
    u = t & 0xFFFF;
    v = t >> 16;
    return (u - v) + (u < v);
}