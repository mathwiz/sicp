A <- function (x, y) {
    if (y == 0) return(0)
    else if (x == 0) return(2 * y)
    else if (y == 1) return(2)
    else return(A(x - 1, A(x, y - 1)))
}

f <- function (n) {
    A(0, n)
}


g <- function (n) {
    A(1, n)
}


h <- function (n) {
    A(2, n)
}


k <- function (n) {
    5 * n * n
}

