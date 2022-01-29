-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load ExXXX
-- Run with func_name arg1...
module Ex128 where

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

non_trivial_square_root :: Int -> Int -> Int -> Int
non_trivial_square_root x square modulus =
  if and [square == 1,
          not (x == 1),
          not (x == (modulus-1))]
  then 0
  else square
                                     
miller_rabin_expmod :: Int -> Int -> Int -> Int
miller_rabin_expmod _ 0 _ = 1
miller_rabin_expmod base exp m | even exp =
                                 let squaremod_with_check x =
                                       non_trivial_square_root x (rem (sq x) m) m
                                 in
                                   squaremod_with_check (miller_rabin_expmod base (div exp 2) m)
miller_rabin_expmod base exp m = rem (base * (miller_rabin_expmod base (exp - 1) m)) m

fermat_test :: Int -> Int -> Bool
fermat_test n rnum = 
  let try_it a = (expmod a n n) == a
  in try_it (1 + rnum)

miller_rabin_test :: Int -> Int -> Bool
miller_rabin_test n rnum = 
  let try_it a = 1 == miller_rabin_expmod a (n-1) n
  in try_it (1 + rnum)

fast_prime n 0 _ = True
fast_prime n times gen =
  let (rnum, newGen) = rand_int (n-1) gen
  in
  if fermat_test n rnum 
  then fast_prime n (times - 1) newGen
  else False

fast_miller_rabin n 0 _ = True
fast_miller_rabin n times gen =
  let (rnum, newGen) = rand_int (n-1) gen
  in
  if miller_rabin_test n rnum 
  then fast_miller_rabin n (times - 1) newGen
  else False

--is_prime n = fast_prime n fast_times (get_rng n)
is_prime n = (find_divisor n 2) == n

test_num n =
  (n,
   is_prime n,
   fast_prime n 128 (get_rng n),
   fast_miller_rabin n 128 (get_rng n)
  )

test_nums vals = report $ map show (map test_num vals)

report vals = mapM_ putStrLn vals


main = do
  putStrLn "(n,Prime,Fast Prime,Miller Rabin)"
  test_nums [11,13,127,561,1105,1729,2465,2821,6601,6603]
