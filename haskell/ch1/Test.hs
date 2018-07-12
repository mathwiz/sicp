-- Load from ghci with :load Test
-- Test by running > fac 6
-- or
-- Run from shell $ runghc Test.hs

main = print (fac 20)

fac 0 = 1
fac n = n * fac (n - 1)
