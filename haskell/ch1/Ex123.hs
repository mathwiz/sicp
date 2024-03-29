-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load ExXXX
-- Run with func_name arg1...

module Ex123 where

sq n = n * n

divides a b = (mod b a) == 0

next n | n == 2 = 3
next n = n + 2

find_divisor n test | sq test > n = n
find_divisor n test | divides test n = test
find_divisor n test = find_divisor n (next test)

smallest_divisor n = find_divisor n 2
