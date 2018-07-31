#=
ex104:
- Julia version: 0.6.4
- Author: Yohan
- Date: 2018-07-31
=#

function a_plus_abs_b_lambda(a, b)
   ( b > 0 ? (x->a+x) : (x->a-x) )(b)
end

a_plus_abs_b(a, b) = a_plus_abs_b_lambda(a, b)
