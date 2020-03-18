gcd <- function(a, b) {
    if (b==0) {
        a
    } else {
        gcd(b, a %% b)
    }
}


# Run in console
# > library(testthat)
# > test_file('this_file.R')

test_that("test1", {
  expect_equal(gcd(206, 40), 2)
  expect_equal(gcd(2, 4), 2)
  expect_equal(gcd(12, 6), 6)
})
