-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load ExXXX
-- Run with func_name arg1...
module Ex127 where

import System.Random
import Control.Monad
import Data.Char


fast_times = 32

sq n = n * n

divides a b = (mod b a) == 0

get_rng seed = mkStdGen seed

rand_int :: Int -> StdGen -> (Int, StdGen)
rand_int limit gen =
  let (rawTargetNum, nextGen) = next gen
  in (rem rawTargetNum limit, nextGen)
 
find_divisor n test | sq test > n = n
find_divisor n test | divides test n = test
find_divisor n test = find_divisor n (test + 1)

expmod :: Int -> Int -> Int -> Int
expmod _ 0 _ = 1
expmod base exp m | even exp = rem (sq (expmod base (div exp 2) m)) m
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

-- Don't know why this is broken
carmichael_num :: Int -> Bool
carmichael_num n =
  let try_it a = (expmod a n n) == a
      iter x = if x == 0 then True
               else if try_it x then iter (n-1)
               else False 
  in and [not $ is_prime n, iter (n-1)]
  
--is_prime n = fast_prime n fast_times (get_rng n)
is_prime n = (find_divisor n 2) == n

test_num n =
  (n,
   is_prime n,
   fast_prime n 128 (get_rng n),
   carmichael_num n)

test_nums vals = report $ map show (map test_num vals)

report vals = mapM_ putStrLn vals
