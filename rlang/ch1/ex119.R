even <- function(x) {
    x %% 2 == 0
}

fib_iter <- function(a, b, p, q, count) {
    if (count == 0) {
        b
    } else if (even(count)) {
        fib_iter(a, b, p*p + q*q, q*q + 2*p*q, count/2)
    } else {
        fib_iter(b*q + a*q + a*p, b*p + a*q, p, q, count-1)
    }
}

fib <- function(n) {
    fib_iter(1, 0, 0, 1, n)
}


# Run in console
# > library(testthat)
# > test_file('this_file.R')

test_that("test1", {
  expect_equal(fib(0), 0)
  expect_equal(fib(1), 1)
  expect_equal(fib(2), 1)
  expect_equal(fib(3), 2)
  expect_equal(fib(4), 3)
  expect_equal(fib(5), 5)
  expect_equal(fib(6), 8)
  expect_equal(fib(7), 13)
  expect_equal(fib(15), 610)
})
