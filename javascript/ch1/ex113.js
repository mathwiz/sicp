psi = function (n) {
    return Math.pow((1.0 + Math.sqrt(5)) / 2, n)
}

phi = function (n) {
    return Math.pow((1.0 - Math.sqrt(5)) / 2, n)
}

fib = function (n) {
    return n < 2 ? n : Math.round((psi(n) - phi(n)) / Math.sqrt(5))
}