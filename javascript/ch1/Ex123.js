// Load with: var ExXXX = require('./ExXXX')
// Run with: ExXXX.xxx()

let sq = n => n * n;

let divides = (a, b) => (b % a) == 0;

let find_divisor = (n, test_divisor) => {
    if (sq(test_divisor) > n) {
        return n;
    } else if (divides(test_divisor, n)) {
        return test_divisor;
    } else {
        return find_divisor(n, next(test_divisor));
    }
};

let next = n => n==2 ? 3 : n+2;

let smallestDiv = n => find_divisor(n, 2);

exports.smallest_divisor = smallestDiv;

exports.test_it = function() {
    console.log(smallestDiv(199));
    console.log(smallestDiv(1999));
    console.log(smallestDiv(19999));
};
