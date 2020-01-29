even<- function(x) {
    x %% 2 == 0
}

mult_inv<- function(b, p, a) {
    if (p == 0) {
        a
    } else if (even(p)) {
        mult_inv(b*2, p/2, a)
    } else {
        mult_inv(b, p-1, a+b)
    }
}

mult<- function(b, p) {
    mult_inv(b, p, 0)
}


# Run in console
# > library(testthat)
# > test_file('ch1/this_file.R')

test_that("test1", {
    expect_equal(mult(2,0), 0)
    expect_equal(mult(2,9), 18)
    expect_equal(mult(3,4), 12)
    expect_equal(mult(3,5), 15)
})
