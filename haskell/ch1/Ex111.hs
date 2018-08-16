module Ex111 where

recursive n = if n < 3 then n else recursive (n-1) + 2 * recursive (n-2) + 3 * recursive (n-3)

iterative n = if n < 3 then n else helper 2 1 0 n

single a b c = a + 2 * b + 3 * c

helper a b c n = if n == 3 then single a b c else helper (single a b c) a b (n-1)