-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load "ExXXX.hs"
-- Run with count_change 100 (should equal 292)

module Ex114 where

biggest_denomiation 1 = 1
biggest_denomiation 2 = 5
biggest_denomiation 3 = 10
biggest_denomiation 4 = 25
biggest_denomiation 5 = 50

cc 0 _ = 1
cc _ 0 = 0
cc amount _ | amount < 0 = 0
cc amount kinds_of_coins = cc amount (kinds_of_coins - 1) + cc (amount - (biggest_denomiation kinds_of_coins)) kinds_of_coins

count_change amount = cc amount 5
