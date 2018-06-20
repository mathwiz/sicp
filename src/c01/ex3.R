larger_sq <- function(x, y, z) {
  if (x<y && x<z) {
    sum_squares(c(y,z))
  } else if (y<x && y<z) {
    sum_squares(c(x,z))
  } else {
    sum_squares(c(x,y))
  }
}


# Run in console
# > library(testthat)
# > test_file('R/sicp1-3.R')

test_that("larger_sq returns correct number", {
  expect_equal(larger_sq(2,3,4), 25)
  expect_equal(larger_sq(5,3,4), 41)
  expect_equal(larger_sq(1,1,1), 2)
})
