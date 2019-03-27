-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load ExXXX
-- Run with func_name arg1...

module Ex117 where

expt_invariant _ 0 a = a
expt_invariant b p a | even p = expt_invariant (b*b) (div p 2) a
expt_invariant b p a = expt_invariant b (p - 1) (a * b)

expt b p = expt_invariant b p 1

times _ 0 = 0
times a b = a + times a (b-1)
