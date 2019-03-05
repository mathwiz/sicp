"""
# module Ex114


# Examples

```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/exXXX.jl")

julia> ExXXX.func(arg)
```
"""
module Ex115

cube(x) = x * x * x

p(x) = 3 * x - 4 * cube(x)

function sine(angle)
    if abs(angle) < 0.1
        return angle
    else
        return p(sine(angle / 3.0))
    end
end

end
