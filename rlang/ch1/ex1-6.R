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
    abs(sq(guess) - x) < 0.001
}

sqrt_iter <- function(guess, x) {
    ifelse(is_good_enough(guess, x), guess, sqrt_iter(improve(guess, x), x))
}

my_sqrt <- function(x) {
    sqrt_iter(1.0, x)
}

new_if <- function(predicate, then_clause, else_clause) {
    if (predicate) then_clause else else_clause
}

bad_sqrt_iter <- function(guess, x) {
    new_if(is_good_enough(guess, x), guess, bad_sqrt_iter(improve(guess, x), x))
}

bad_sqrt  <- function(x){
    bad_sqrt_iter(1.0, x)
}


# Run in console
# > library(testthat)
# > test_file('ex1-6.R')

delta = 0.00001

test_that("my_sqrt failed", {
    expect_equal(my_sqrt(2), sqrt(2), tolerance=delta)
})

test_that("bad_sqrt failed", {
    expect_equal(bad_sqrt(2), sqrt(2), tolerance=delta)
})
