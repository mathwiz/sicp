larger_sq <- function(x, y, z) {
    if (x <= y && x <= z) {
        sum_squares(c(y, z))
    } else if (y <= x && y <= z) {
        sum_squares(c(x, z))
    } else {
        sum_squares(c(x, y))
    }
}

largerSq <- function(x, y, z) {
    args <- c(x, y, z)
    Reduce(x=square(args[-which.min(args)]), f=sum)
}

largerSq2 <- function(x, y, z) {
    args <- c(x, y, z)
    xs <- args[-which.min(args)]
    sum(xs*xs)
}


# Run in consolec
# > library(testthat)
# > test_file('ex1-3.R')

test_that("largerSq2 returns correct number", {
    expect_equal(largerSq2(2, 3, 4), 25)
    expect_equal(largerSq2(5, 3, 4), 41)
    expect_equal(largerSq2(1, 1, 1), 2)
    expect_equal(largerSq2(2, 1, 1), 5)
    expect_equal(largerSq2(1, 2, 1), 5)
    expect_equal(largerSq2(1, 1, 2), 5)
})

test_that("largerSq returns correct number", {
    expect_equal(largerSq(2, 3, 4), 25)
    expect_equal(largerSq(5, 3, 4), 41)
    expect_equal(largerSq(1, 1, 1), 2)
    expect_equal(largerSq2(2, 1, 1), 5)
    expect_equal(largerSq2(1, 2, 1), 5)
    expect_equal(largerSq2(1, 1, 2), 5)
})

test_that("larger_sq returns correct number", {
    expect_equal(larger_sq(2, 3, 4), 25)
    expect_equal(larger_sq(5, 3, 4), 41)
    expect_equal(larger_sq(1, 1, 1), 2)
    expect_equal(larger_sq(2, 1, 1), 5)
    expect_equal(larger_sq(1, 2, 1), 5)
    expect_equal(larger_sq(1, 1, 2), 5)
})
