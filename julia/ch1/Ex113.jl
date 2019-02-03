"""
# module Ex113

- Julia version: 0.6.4
- Author: Yohan
- Date: 2019-02-03

# Examples

```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/ex112.jl")

julia> Ex113.fib(15) #610
```
"""
module Ex113

psi(n) = ((1.0 + sqrt(5)) / 2) ^ n

phi(n) = ((1.0 - sqrt(5)) / 2) ^ n

fib(n) = (n < 2) ? n : round(Int64, (psi(n) - phi(n)) / sqrt(5))

end