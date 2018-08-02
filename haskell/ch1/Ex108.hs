module Ex108 where

sq x = x * x

cube x = x * x * x

improve guess x = (x / sq(guess) + 2 * guess) / 3.0

is_good_enough guess x = abs (cube guess - x) < (guess / 100000.0)

cbrt_iter guess x = if (is_good_enough guess x) then guess else cbrt_iter (improve guess x) x

cbrt x = cbrt_iter 1.0 x
