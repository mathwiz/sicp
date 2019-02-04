psi <- function(n) {
    ((1 + sqrt(5)) / 2) ^ n
}

phi <- function(n) {
    ((1 - sqrt(5)) / 2) ^ n
}

fib <- function(n) {
    if (n < 2) n else round((psi(n) - phi(n)) / sqrt(5))
}


# Run in console
# > library(testthat)
# > test_file('ex113.R')

test_that("fib", {
    expect_equal(fib(0), 0)
    expect_equal(fib(1), 1)
    expect_equal(fib(2), 1)
    expect_equal(fib(3), 2)
    expect_equal(fib(4), 3)
    expect_equal(fib(10), 55)
    expect_equal(fib(15), 610)
})
