r <- (5 + 4 + (2 - (3 - (6 + (4 / 5))))) / (3 * (6 - 2) * (2 - 7))

f <- fractions(r)

test_that("Test rational", {
  expect_equal(f, fractions(-37/150))
})


# Run in console
# > library(testthat)
# > test_file('R/ex2.R')
