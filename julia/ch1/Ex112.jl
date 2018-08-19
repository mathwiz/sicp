"""
# module Ex112

- Julia version: 0.6.4
- Author: Yohan
- Date: 2018-08-19

# Examples

```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/ex112.jl")

julia> Ex112.pascal(3, 2)
```
"""
module Ex112

pascal(r, n) = (n == 1 || n == r) ? 1 : pascal(r - 1, n - 1) + pascal(r - 1, n)

end