pascal <- function(r, n) {
    if (n == 1 || n == r) 1 else pascal(r-1, n-1) + pascal(r-1, n)
}


# Run in console
# > library(testthat)
# > test_file('ex113.R')

test_that("fib", {
    expect_equal(pascal(4, 1), 1)
    expect_equal(pascal(4, 2), 3)
    expect_equal(pascal(4, 3), 3)
    expect_equal(pascal(4, 4), 1)
})
