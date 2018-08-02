#=
ex109:
- Julia version: 
- Author: Yohan
- Date: 2018-08-02

Load with > include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/ex103.jl")
Run with > Ex109.plus_r(2, 3)
=#

module Ex109
export plus_r, plus_it

inc(x) = x + 1

dec(x) = x - 1

plus_r(a, b) = a == 0 ? b : inc(plus_r(dec(a), b))

plus_it(a, b) = a == 0 ? b : plus_it(dec(a), inc(b))

end