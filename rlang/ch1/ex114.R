biggest_denomination <- function(n) {
    if (n==1) {
        1
    } else if (n==2) {
        5
    } else if (n==3) {
        10
    } else if (n==4) {
        25
    } else if (n==5) {
        50
    }
}

cc <- function(n, kinds_of_coins) {
    if (n==0) {
        1
    } else if (n < 0 || kinds_of_coins == 0) {
        0
    } else {
        cc(n, kinds_of_coins-1) + cc(n-biggest_denomination(kinds_of_coins), kinds_of_coins)
    }
}

count_change <- function(n) {
    cc(n, 5)
}


# Run in console
# > library(testthat)
# > test_file('ch1/this_file.R')

test_that("test1", {
    expect_equal(count_change(0), 1)
    expect_equal(count_change(1), 1)
    expect_equal(count_change(2), 1)
    expect_equal(count_change(11), 4)
    expect_equal(count_change(100), 292)
})
