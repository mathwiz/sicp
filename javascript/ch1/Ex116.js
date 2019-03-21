// Load with: var ExXXX = require('./ExXXX')
// Run with: ExXXX.test()

sq = function (x) {
    return x * x;
};

even = function (x) {
    return x % 2 == 0;
};

expt_invariant = function (b, p, a) {
    if (p == 0) return a;
    if (even(p)) return expt_invariant(sq(b), p / 2, a);
    return expt_invariant(b, p - 1, a * b);
};

exports.expt = function (b, p) {
    return expt_invariant(b, p, 1);
};

exports.test = function() {
    console.log(exports.expt(2,0));
    console.log(exports.expt(2,1));
    console.log(exports.expt(2,2));
    console.log(exports.expt(2,8));
    console.log(exports.expt(2,9));
    console.log(exports.expt(3, 4));
};