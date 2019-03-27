even<- function(x) {
    x %% 2 == 0
}

expt_inv<- function(b, p, a) {
    if (p == 0) {
        a
    } else if (even(p)) {
        expt_inv(b*b, p/2, a)
    } else {
        expt_inv(b, p-1, a*b)
    }
}

expt<- function(b, p) {
    expt_inv(b, p, 1)
}


# Run in console
# > library(testthat)
# > test_file('ch1/this_file.R')

test_that("test1", {
    expect_equal(expt(2,0), 1)
    expect_equal(expt(2,9), 512)
    expect_equal(expt(3,4), 81)
    expect_equal(expt(3,5), 243)
})
