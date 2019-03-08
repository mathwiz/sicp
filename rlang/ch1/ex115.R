p <- function(x) {
    3 * x - 4 * cube(x)
}

sine<- function(angle) {
    if (abs(angle) < 0.1) {
        angle
    } else {
        p(sine(angle / 3.0))
    }
}

cube <- function(x) {
    x * x * x
}


# Run in console
# > library(testthat)
# > test_file('ch1/this_file.R')

test_that("test1", {
    expect_equal(sine(0), 0)
    expect_true(sine(2) > 0.908)
    expect_true(sine(3) < 0.141)
})
