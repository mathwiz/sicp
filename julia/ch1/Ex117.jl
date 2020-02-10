"""
```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/exXXX.jl")

julia> ExXXX.func(arg)
```
"""
module Ex117

times(a, b) = mult_inv(a, b)

function mult_inv(a, b)
    if b == 0
        return 0
    elseif b % 2 == 0
        return 2 * mult_inv(a, b / 2)
    else
        return a + mult_inv(a, b - 1)
    end
end

end
