#pragma once

#include "../../interface/IIdeaMA.cuh"

class Addition : public IIdeaMA
{
public:
    Addition() {}
    u_short calc(const u_short &x) const override;
    u_short calc(const u_short &x, const u_short &y) const override;
};