source("../functions.R")

larger_sq <- function(x, y, z) {
    if (x < y && x < z) {
        sum_squares(c(y, z))
    } else if (y < x && y < z) {
        sum_squares(c(x, z))
    } else {
        sum_squares(c(x, y))
    }
}

largerSq <- function(x, y, z) {
    args <- c(x, y, z)
    Reduce(x=square(args[args!=min(args)]), f=sum)
}

largerSq2 <- function(x, y, z) {
    args <- c(x, y, z)
    elems <- args[args!=min(args)]
    xs <- if (length(elems) == 0) args[-1] else elems # use any 2 elements if all args are equal
    sum(xs*xs)
}


# Run in consolec
# > library(testthat)
# > test_file('R/sicp1-3.R')

test_that("largerSq2 returns correct number", {
    expect_equal(largerSq2(2, 3, 4), 25)
    expect_equal(largerSq2(5, 3, 4), 41)
    expect_equal(largerSq2(1, 1, 1), 2)
})

test_that("largerSq returns correct number", {
    expect_equal(largerSq(2, 3, 4), 25)
    expect_equal(largerSq(5, 3, 4), 41)
    # does not handle this case: expect_equal(largerSq(1, 1, 1), 2)
})

test_that("larger_sq returns correct number", {
    expect_equal(larger_sq(2, 3, 4), 25)
    expect_equal(larger_sq(5, 3, 4), 41)
    expect_equal(larger_sq(1, 1, 1), 2)
})
