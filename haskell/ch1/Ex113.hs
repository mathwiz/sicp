-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load "Ex112.hs"
-- Run with fib 15 (should equal 610)

module Ex113 where

-- return nth Fibonacci number
psi :: Int -> Float
psi n = ((1.0 + sqrt 5) / 2) ** fromIntegral n
phi :: Int -> Float
phi n = ((1.0 - sqrt 5) / 2) ** fromIntegral n

fib :: Int -> Int
fib n | n < 2 = n
fib n = round (((psi n) - (phi n)) / sqrt(5))
