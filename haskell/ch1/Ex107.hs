module Ex107 where

square x = x * x

average x y = (x + y) / 2.0

improve guess x = average guess (x / guess)

is_good_enough guess x = abs (square guess - x) < (guess / 100000.0)

sqrt_iter guess x = if (is_good_enough guess x) then guess else sqrt_iter (improve guess x) x

sqrt x = sqrt_iter 1.0 x
