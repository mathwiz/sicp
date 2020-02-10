// Load with: var ExXXX = require('./ExXXX')
// Run with: ExXXX.xxx()

even = function (x) {
    return x % 2 == 0;
};

mult_invariant = function (a, b) {
    if (b == 0) return 0;
    if (even(b)) return 2 * mult_invariant(a, b / 2);
    return a + mult_invariant(a, b - 1);
};

times = function (a, b) {
    return mult_invariant(a, b);
};


exports.times = times;