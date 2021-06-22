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

is_prime <- function(n) {
  n == smallest_divisor(n)
}

report_prime <- function(n) {
  result = ifelse(is_prime(n), " *** ", "")
  print(noquote(paste(toString(n), result)))
}

search_helper <- function(n, end) {
  if (n <= end) {
    report_prime(n)
    search_helper(n + 2, end)
  } else {
    print(noquote("finished"))
  }
}

search_for_primes <- function(start, end) {
  search_helper(ifelse(divides(2, start), start + 1, start), end)
}


# Run in console
# > library(testthat)
# > test_file('this_file.R')

# test_that("test1", {
#   expect_equal(smallest_divisor(199), 199)
#   expect_equal(smallest_divisor(1999), 1999)
#   expect_equal(smallest_divisor(19999), 7)
# })

# Try these tests
search_for_primes(1000, 1020)
search_for_primes(10000, 10040)
search_for_primes(100000, 100080)


