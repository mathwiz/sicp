#=
ex106:
- Julia version: 0.6.4
- Author: Yohan
- Date: 2018-08-01
=#

function square(x)
  x * x
end

function average(x, y)
  (x + y) / 2.0
end

function improve(guess, x)
  average(guess, x / guess)
end

function good_enough(guess, x)
  abs((square(guess) - x)) < 0.001
end

function sqrt_iter(guess, x)
  good_enough(guess, x) ? guess : sqrt_iter(improve(guess, x), x)
end

function my_sqrt(x)
  sqrt_iter(1.0, x)
end

function bad_sqrt_iter(guess, x)
  new_if(good_enough(guess, x), guess, bad_sqrt_iter(improve(guess, x), x))
end

function bad_sqrt(x)
  bad_sqrt_iter(1.0, x)
end

function new_if(predicate, then_clause, else_clause)
  predicate ? then_clause : else_clause
end
