"""
```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/exXXX.jl")

julia> ExXXX.func(arg)
```
"""
module Ex117

times(b, p) = mult_inv(b, p, 0)

function mult_inv(b, p, a)
    if p == 0
        return a
    elseif p % 2 == 0
        return mult_inv(b * 2, p / 2, a)
    else
        return mult_inv(b, p - 1, a + b)
    end
end

end
