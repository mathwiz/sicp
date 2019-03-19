-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load "ExXXX.hs"
-- Run with func_name arg1...

module Ex116 where

expt_invariant _ 0 a = a
expt_invariant b p a | even p = expt_invariant (sq b) (div p 2) a
expt_invariant b p a = expt_invariant b (p - 1) (a * b)

expt_inv b p = expt_invariant b p 1

sq x = x * x
