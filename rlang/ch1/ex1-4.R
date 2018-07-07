a_plus_abs_b <- function(a,b) {
  eval(call(ifelse(b>0,"+","-"), a, b))
}

# Run in console
library(testthat)
# > test_file('ex1-4.R')

test_that("a_plus_abs_b returns correct number", {
  expect_equal(a_plus_abs_b(1,2), 3)
  expect_equal(a_plus_abs_b(1,-2), 3)
  expect_equal(a_plus_abs_b(-1,2), 1)
  expect_equal(a_plus_abs_b(-1,-2), 1)
})
