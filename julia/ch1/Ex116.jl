"""
```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/exXXX.jl")

julia> ExXXX.func(arg)
```
"""
module Ex116

expt(b, p) = expt_inv(b, p, 1)

function expt_inv(b, p, a)
    if p == 0
        return a
    elseif p % 2 == 0
        return expt_inv(b*b, p / 2, a)
    else
        return expt_inv(b, p - 1, a*b)
    end
end

end
