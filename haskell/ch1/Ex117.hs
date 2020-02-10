-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load ExXXX
-- Run with func_name arg1...

module Ex117 where

mult_invariant _ 0 = 0
mult_invariant a b | even b = 2 * (mult_invariant a (div b 2))
mult_invariant a b = a + mult_invariant a (b - 1)

times a b = mult_invariant a b
