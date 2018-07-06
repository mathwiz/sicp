# Title     : recursion
# Objective : Examples of recursive functions
# Created by: Yohan
# Created on: 7/6/2018

mysum <- function (xs, acc) {
    if (length(xs) == 0) return (acc)
    else return (mysum(tail(xs, - 1), acc + xs[1]))
}
