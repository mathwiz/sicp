module Ex104 where

main = a_plus_abs_b (-2) (-4)

plus = \x y -> x + y

diff = \x y -> x - y

a_plus_abs_b a b = (if b > 0 then plus else diff) a b
