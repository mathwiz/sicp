// Load with: var ExXXX = require('./ExXXX')
// Run with: ExXXX.xxx()

even = function (x) {
    return x % 2 == 0;
};

sq = function(x) {
    return x * x;
};

fib_iter = function (a, b, p, q, count) {
    if (count == 0) return b;
    if (even(count)) return fib_iter(a, b, sq(p) + sq(q), sq(q) + 2*p*q, count / 2);
    return fib_iter(b*q + a*q + a*p, b*p + a*q, p, q, count - 1);
};

fib = function (n) {
    return fib_iter(1, 0, 0, 1, n);
};


exports.fib = fib;