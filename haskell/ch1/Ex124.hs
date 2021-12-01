-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load ExXXX
-- Run with func_name arg1...
module Ex124 where

import System.Random
import Control.Monad
import Data.Char

fast_times = 3

sq n = n * n

divides a b = (mod b a) == 0

rand_nums n = replicateM n (randomRIO (0 :: Double, 1)) 

rand_ints :: Int -> Int -> Int -> IO [Int]
rand_ints n lo hi = do
  nums <- replicateM n (randomRIO (lo :: Int, hi)) 
  return nums

random_num :: Integer -> Integer
random_num limit = do
--  gen <- mkStdGen limit
  limit - 1

find_divisor n test | sq test > n = n
find_divisor n test | divides test n = test
find_divisor n test = find_divisor n (test + 1)

expmod :: Integer -> Integer -> Integer -> Integer
expmod _ 0 _ = 1
expmod base exp m | even exp = rem (sq (expmod base (div exp 2) m)) m
expmod base exp m = rem (base * (expmod base (exp - 1) m)) m

--Could not figure out random number version
fermat_test :: Integer -> Bool
fermat_test n = 
  let try_it a = (expmod a n n) == a
  in try_it (1 + random_num n)

fast_prime n 0 = True
fast_prime n times =
  if fermat_test n
  then fast_prime n (n - 1)
  else False

is_prime n = fast_prime n fast_times

prime_test n | is_prime n = show n ++ " ***"
prime_test n = show n

range start end = [start, (start + 2) .. end]

make_range start end = if odd start
                       then range start end
                       else range (start + 1) end

report vals = mapM_ putStrLn vals

search_for_primes start end = report (map prime_test (make_range start end))
