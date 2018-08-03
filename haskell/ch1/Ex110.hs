module Ex110 where

A _ 0 = 0
A _ 1 = 2
A 0 y = 2 * y
A x y = A (pred x) (A x (pred y))
