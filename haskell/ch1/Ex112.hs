-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load "Ex112.hs"
-- Run with pascal 1 1

module Ex112 where

pascal _ 1 = 1
pascal r n | n == r = 1
pascal r n = pascal (r - 1) (n - 1) + pascal (r - 1) n
