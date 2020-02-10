// Load with: var ExXXX = require('./ExXXX')
// Run with: ExXXX.xxx()

even = function (x) {
    return x % 2 == 0;
};

mult_invariant = function (b, p, a) {
    if (p == 0) return a;
    if (even(p)) return mult_invariant(b * 2, p / 2, a);
    return mult_invariant(b, p - 1, a + b);
};

times = function (b, p) {
    return mult_invariant(b, p, 0);
};


exports.times = times;