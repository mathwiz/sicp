#functions

square <- function(xs) Map(function(x) x * x, xs)
sum_squares <- function(xs) Reduce(sum, square(xs))
