#pragma once

#include "../../../types.cuh"

class IIdeaMA
{
public:
    virtual ~IIdeaMA() = default;
    virtual u_short calc(const u_short &x) const = 0;
    virtual u_short calc(const u_short &x, const u_short &y) const = 0;
};