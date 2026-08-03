#pragma once

#include "../../interface/IIdeaMA.hpp"

class Multiplication : public IIdeaMA
{
public:
    Multiplication() {}
    u_short calc(const u_short &x) const override;
    u_short calc(const u_short &x, const u_short &y) const override;
};