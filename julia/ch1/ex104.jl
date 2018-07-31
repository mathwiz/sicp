#=
ex104:
- Julia version: 0.6.4
- Author: Yohan
- Date: 2018-07-31
=#

a_plus_abs_b_lambda(a, b) = ( b > 0 ? (x->a+x) : (x->a-x) )(b)

function a_plus_abs_b_operator(a, b)
   (if b > 0
       +
   else
       -
   end)(a,b)
end

a_plus_abs_b(a, b) = a_plus_abs_b_operator(a, b)
