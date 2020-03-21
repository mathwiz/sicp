"""
```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/ExXXX.jl")

julia> ExXXX.func(arg)
```
"""
module Ex120

function gcd(a, b)
    if b == 0
        return a
     else
        return gcd(b, a % b)
    end
end

end
