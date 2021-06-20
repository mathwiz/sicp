-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load ExXXX
-- Run with func_name arg1...

module Ex122 where

sq n = n * n

divides a b = (mod b a) == 0

find_divisor n test | sq test > n = n
find_divisor n test | divides test n = test
find_divisor n test = find_divisor n (test + 1)

smallest_divisor n = find_divisor n 2

is_prime n = (smallest_divisor n) == n

prime_test n | is_prime n = show n ++ " ***"
prime_test n = show n

range start end = [start, (start + 2) .. end]

make_range start end = if odd start
                       then range start end
                       else range (start + 1) end

report vals = mapM_ putStrLn vals

search_for_primes start end = report (map prime_test (make_range start end))
