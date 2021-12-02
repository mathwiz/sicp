-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load ExXXX
-- Run with func_name arg1...
module Ex126 where

import System.Random
import Control.Monad
import Data.Char


fast_times = 3

sq n = n * n

divides a b = (mod b a) == 0

get_rng seed = mkStdGen seed

rand_nums n = replicateM n (randomRIO (0 :: Double, 1)) 

rand_ints :: Int -> Int -> Int -> IO [Int]
rand_ints n lo hi = do
  nums <- replicateM n (randomRIO (lo :: Int, hi-1)) 
  return nums

rand_int :: Int -> StdGen -> (Int, StdGen)
rand_int limit gen =
  let (rawTargetNum, nextGen) = next gen
  in (rem rawTargetNum limit, nextGen)
 
find_divisor n test | sq test > n = n
find_divisor n test | divides test n = test
find_divisor n test = find_divisor n (test + 1)

-- Inefficiently use 2 multiplcations instead of sq function. Painfully slow.
expmod :: Int -> Int -> Int -> Int
expmod _ 0 _ = 1
expmod base exp m | even exp = rem ((expmod base (div exp 2) m) * (expmod base (div exp 2) m)) m
expmod base exp m = rem (base * (expmod base (exp - 1) m)) m

fermat_test :: Int -> Int -> Bool
fermat_test n rnum = 
  let try_it a = (expmod a n n) == a
  in try_it (1 + rnum)

fast_prime n 0 _ = True
fast_prime n times gen =
  let (rnum, newGen) = rand_int (n-1) gen
  in
  if fermat_test n rnum 
  then fast_prime n (times - 1) newGen
  else False

is_prime n = fast_prime n fast_times (get_rng n)
--revert to Ex122 version
--is_prime n = (find_divisor n 2) == n

prime_test n | is_prime n = show n ++ " ***"
prime_test n = show n

range start end = [start, (start + 2) .. end]

make_range start end = if odd start
                       then range start end
                       else range (start + 1) end

report vals = mapM_ putStrLn vals

search_for_primes start end = report (map prime_test (make_range start end))
