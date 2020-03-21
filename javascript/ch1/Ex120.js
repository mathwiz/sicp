// Load with: var ExXXX = require('./ExXXX')
// Run with: ExXXX.xxx()

gcd = function (a, b) {
    if (b == 0) return a;
    return gcd(b, a % b);
};


exports.gcd = gcd;