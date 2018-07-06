# Title     : TODO
# Objective : TODO
# Created by: Yohan
# Created on: 7/3/2018

p <- function() { p() }

test <- function(x, y) {
    if (x == 0) 0 else y
}

# Try this. Hmm...this does not produce infinite recursion
# test(0, p()) => 0
# While the following does produce infinite recursion
# p()
