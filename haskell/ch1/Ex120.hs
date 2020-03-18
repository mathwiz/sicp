-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load ExXXX
-- Run with func_name arg1...

module Ex120 where

gcd a 0 = a
gcd a b = Ex120.gcd b (mod a b)

