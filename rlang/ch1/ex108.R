sq <- function(x) {
    x * x
}

cube <- function(x) {
    x * x * x
}

improve <- function(guess, x) {
    (2 * guess + x / sq(guess)) / 3.0
}

is_good_enough <- function(guess, x) {
    abs(cube(guess) - x) < (guess / 100000)
}

cbrt_iter <- function(guess, x) {
    ifelse(is_good_enough(guess, x), guess, cbrt_iter(improve(guess, x), x))
}

my_cbrt <- function(x) {
    cbrt_iter(1.0, x)
}


# Run in console
library(testthat)
# > test_file('ch1/ex108.R')

delta = 0.0001

test_that("small failed", {
    expect_equal(cube(my_cbrt(27)), 27.0, tolerance=delta)
})

test_that("smaller failed", {
    expect_equal(cube(my_cbrt(0.00027)), 0.00027, tolerance=delta)
})
