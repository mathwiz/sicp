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
  ## n == smallest_divisor(n)
  fast_prime(n, 3)
}

fast_prime <- function(n, times) {
  if (times == 0) {
    TRUE
  } else if (fermat_test(n)) {
    fast_prime(n, times-1)
  } else {
    FALSE
  }
}

fermat_test <- function(n) {
  try_it <- function(a) { a == expmod(a, n, n) }
  try_it(1 + random(n-1))
}

## Inefficiently call function twice and multiply rather than use square
## Much slower
expmod <- function(base, exp, m) {
  if (exp == 0) {
    1
  } else if (divides(2,exp)) {
    (expmod(base, exp/2, m) * expmod(base, exp/2, m)) %% m
  } else {
    (base * expmod(base, exp-1, m)) %% m
  }
}

square <- function(n) {
  n * n
}

random <- function(limit) {
  sample(0:limit, 1)
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


