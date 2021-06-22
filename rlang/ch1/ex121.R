# setwd("c:/Users/Yohan/IdeaProjects/sicp/rlang/ch1")
# getwd()
# load with source("filename")


divides <- function(a, b) {
  0 == b %% a
}

find_divisor <- function(n, test) {
  if (test * test > n) {
    n
  } else if (divides(test, n)) {
    test
  } else {
    find_divisor(n, test + 1)
  }
}

smallest_divisor <- function(n) {
  find_divisor(n, 2)
}


# Run in console
# > library(testthat)
# > test_file('this_file.R')

test_that("test1", {
  expect_equal(smallest_divisor(199), 199)
  expect_equal(smallest_divisor(1999), 1999)
  expect_equal(smallest_divisor(19999), 7)
})
