module Ex110 where

a _ 0 = 0
a _ 1 = 2
a x y = if x==0 then 2 * y else a (pred x) (a x (pred y))

f n = a 0 n
g n = a 1 n
h n = a 2 n
k n = 5 * n * n
