# Title     : TODO
# Objective : TODO
# Created by: Yohan
# Created on: 7/5/2018

sq <- function(x) {
    x * x
}

average <- function(x, y) {
    (x + y) / 2.0
}

improve <- function(guess, x) {
    average(guess, x / guess)
}

is_good_enough <- function(guess, x) {
    abs(sq(guess) - x) < (guess / 100000)
}

sqrt_iter <- function(guess, x) {
    ifelse(is_good_enough(guess, x), guess, sqrt_iter(improve(guess, x), x))
}

my_sqrt <- function(x) {
    sqrt_iter(1.0, x)
}


# Run in console
# > library(testthat)
# > test_file('ch1/ex1-7.R')

delta = 0.00001

test_that("small failed", {
    expect_equal(my_sqrt(0.02), sqrt(0.02), tolerance=delta)
})

test_that("smaller failed", {
    expect_equal(my_sqrt(0.0002), sqrt(0.0002), tolerance=delta)
})
