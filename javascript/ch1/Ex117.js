// Load with: var ExXXX = require('./ExXXX')
// Run with: ExXXX.xxx()

even = function (x) {
    return x % 2 == 0;
};

expt_invariant = function (b, p, a) {
    if (p == 0) return a;
    if (even(p)) return expt_invariant(b * b, p / 2, a);
    return expt_invariant(b, p - 1, a * b);
};

expt = function (b, p) {
    return expt_invariant(b, p, 1);
};

times = function (a, b) {
    if (b == 0) return 0;
    return a + times(a, b - 1);
};

exports.expt = expt;
exports.times = times;