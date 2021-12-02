"""
```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/ExXXX.jl")

julia> ExXXX.func(arg)
```
"""
module Ex123

sq(n) = n * n

divides(a, b) = b % a == 0

function find_divisor(n, test)
    if sq(test) > n
        return n
    elseif divides(test, n)
        return test
    else
        return find_divisor(n, next(test))
    end
end

next(n) = n==2 ? 3 : n + 2

smallest_divisor(n) = find_divisor(n, 2)

end
