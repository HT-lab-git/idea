#include "../include/Addition.cuh"

u_short Addition::calc(const u_short &x, const u_short &y)
{
    return (x + y) & 0xFFFF;
}