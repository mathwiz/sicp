#=
ex108:
- Julia version: 0.6.4
- Author: Yohan
- Date: 2018-08-01
=#

function square(x)
  x * x
end

function cube(x)
  x * x * x
end

function improve(guess, x)
  (x / square(guess) + 2 * guess) / 3.0
end

function good_enough(guess, x)
  abs(cube(guess) - x) < (guess / 100000.0)
end

function cbrt_iter(guess, x)
  good_enough(guess, x) ? guess : cbrt_iter(improve(guess, x), x)
end

function my_cbrt(x)
  cbrt_iter(1.0, x)
end
