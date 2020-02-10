"""
```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/exXXX.jl")

julia> ExXXX.func(arg)
```
"""
module Ex119

fib(n) = fib_iter(1, 0, 0, 1, n)

function fib_iter(a, b, p, q, count)
    if count == 0
        return b
    elseif count % 2 == 0
        return fib_iter(a, b, p*p + q*q, q*q + 2*p*q, count / 2)
    else
        return fib_iter(b*q + a*q + a*p, b*p + a*q, p, q, count - 1)
    end
end

end
