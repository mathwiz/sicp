even<- function(x) {
    x %% 2 == 0
}

mult_inv<- function(a, b) {
    if (b == 0) {
        0
    } else if (even(b)) {
        2 * mult_inv(a, b/2)
    } else {
        a + mult_inv(a, b-1)
    }
}

mult<- function(a, b) {
    mult_inv(a, b)
}


# Run in console
# > library(testthat)
# > test_file('this_file.R')

test_that("test1", {
    expect_equal(mult(2,0), 0)
    expect_equal(mult(2,9), 18)
    expect_equal(mult(3,4), 12)
    expect_equal(mult(3,5), 15)
})
