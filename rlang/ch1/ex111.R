recursive <- function(n) {
    if (n < 3) n else recursive(n-1) + 2 * recursive(n-2) + 3 * recursive(n-3)
}

single <- function(a, b, c) {
    a + 2 * b + 3 * c
}

helper <- function(a, b, c, x) {
    if (x == 3) single(a, b, c) else helper(single(a, b, c), a, b, x - 1)
}

iterative <- function(n) {
    if (n < 3) n else helper(2, 1, 0, n)
}
