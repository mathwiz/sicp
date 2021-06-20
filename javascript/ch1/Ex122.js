// Load with: const ExXXX = require('./ExXXX')
// Run with: ExXXX.xxx()

let sq = n => n * n;

let divides = (a, b) => (b % a) == 0;

let find_divisor = (n, test_divisor) => {
    if (sq(test_divisor) > n) {
        return n;
    } else if (divides(test_divisor, n)) {
        return test_divisor;
    } else {
        return find_divisor(n, test_divisor + 1);
    }
};

let smallest_divisor = n => find_divisor(n, 2);

let odd = n => !divides(2, n);

let is_prime = n => n == smallest_divisor(n);

let prime_test = n => {
    if (is_prime(n)) {
        console.log(n + " ***");
    } else {
        console.log(n);
    }
};

let search_helper = (n, end) => {
    if (n <= end) {
        prime_test(n);
        search_helper(n + 2, end);
    } else {
        console.log("finished\n");
    }
};

let search_for_primes = (start, end) => search_helper(odd(start) ? start : start + 1, end);

exports.search_for_primes = search_for_primes;

exports.test_it = function () {
    search_for_primes(1000, 1020);
    search_for_primes(10000, 10040);
    search_for_primes(100000, 100080);
};