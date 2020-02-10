-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load ExXXX
-- Run with func_name arg1...

module Ex118 where

mult_invariant _ 0 a = a
mult_invariant b p a | even p = mult_invariant (b*2) (div p 2) a
mult_invariant b p a = mult_invariant b (p - 1) (a + b)

times a b = mult_invariant a b 0
