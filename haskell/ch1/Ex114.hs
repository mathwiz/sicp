-- :cd C:\Users\Yohan\IdeaProjects\sicp\haskell\ch1
-- :load "ExXXX.hs"
-- Run with count_change 100 (should equal 292)

module Ex114 where

biggest_denomination 1 = 1
biggest_denomination 2 = 5
biggest_denomination 3 = 10
biggest_denomination 4 = 25
biggest_denomination 5 = 50
biggest_denomination _ = error "Can't handle that many denominations!"

cc 0 _ = 1
cc _ 0 = 0
cc amount _ | amount < 0 = 0
cc amount kinds_of_coins = cc amount (kinds_of_coins - 1) + cc (amount - (biggest_denomination kinds_of_coins)) kinds_of_coins

count_change amount = cc amount 5
