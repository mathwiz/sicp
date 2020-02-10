-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load ExXXX
-- Run with func_name arg1...

module Ex119 where

fib_iter _ b _ _ 0 = b
fib_iter a b p q count | even count = fib_iter a b (p*p + q*q) (q*q + 2*p*q) (div count 2)
fib_iter a b p q count = fib_iter (b*q + a*q + a*p) (b*p + a*q) p q (count - 1)

fib n = fib_iter 1 0 0 1 n
