-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load "ExXXX.hs"
-- Run with count_change 100 (should equal 292)

module Ex114 where

psi :: Int -> Float
psi n = ((1.0 + sqrt 5) / 2) ** fromIntegral n
phi :: Int -> Float
phi n = ((1.0 - sqrt 5) / 2) ** fromIntegral n

fib :: Int -> Int
fib n | n < 2 = n
fib n = round (((psi n) - (phi n)) / sqrt(5))
