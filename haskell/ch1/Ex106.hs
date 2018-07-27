module Ex106 where

square x = x * x

average x y = (x + y) / 2.0

improve guess x = average guess (x / guess)

is_good_enough guess x = abs (square guess - x) < 0.001

sqrt_iter guess x = if (is_good_enough guess x) then guess else sqrt_iter (improve guess x) x

sqrt x = sqrt_iter 1.0 x

new_if predicate then_clause else_clause = if predicate then then_clause else else_clause

bad_sqrt_iter guess x = new_if (is_good_enough guess x) guess (bad_sqrt_iter (improve guess x) x)

---will this hang? Nope.
bad_sqrt x = bad_sqrt_iter 1.0 x
