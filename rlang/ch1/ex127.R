# setwd("c:/Users/Yohan/IdeaProjects/sicp/rlang/ch1")
# getwd()
# load with source("filename")


square <- function(n) {
  n * n
}

random <- function(limit) {
  sample(0:limit, 1)
}

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

expmod <- function(base, exp, m) {
  if (exp == 0) {
    1
  } else if (divides(2,exp)) {
    square(expmod(base, exp/2, m)) %% m
  } else {
    (base * expmod(base, exp-1, m)) %% m
  }
}

# cannot handle deep recursion
carmichael_num <- function(n) {
  try_it <- function(a) { a == expmod(a, n, n) }
  iter <- function(x) {
      for (i in x:0) {
          if (i == 0) {
              return(TRUE)
          } else if (!try_it(i)) {
              return(FALSE)
          }    
      }
  }    
  !is_prime(n) && iter(n-1)
}

test_number <- function(n) {
  print(noquote(paste(toString(n),
                      " Prime:", is_prime(n),
                      " Fast Prime:", fast_prime(n, 4),
                      " Carmichael:", carmichael_num(n))))
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
test_number(9)
test_number(10)
test_number(11)
test_number(31)
test_number(59)
test_number(561)
test_number(1105)
test_number(1729)
test_number(2465)
test_number(2821)
test_number(6601)
