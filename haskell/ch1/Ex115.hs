-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load "ExXXX.hs"
-- Run with count_change 100 (should equal 292)

module Ex115 where

p x = 3 * x - 4 * cube x

sine angle | abs angle < 0.1 = angle
sine angle = p (sine (angle / 3.0))

cube x = x * x * x
