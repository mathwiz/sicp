// Load with: const ExXXX = require('./ExXXX')
// Run with: ExXXX.xxx()

let fast_times = 3;

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

//let is_prime = n => n == smallest_divisor(n);
let is_prime = n => fast_prime(n, fast_times);

let fast_prime = (n, times) => {
    if (times==0) {
        return true;
    } else if (fermat_test(n)) {
        return fast_prime(n, times-1);
    } else {
        return false;
    }
};

let fermat_test = n => {
    let try_it = a => a == expmod(a, n, n);
    return try_it(1 + random(n-1));
}

let expmod = (base, exp, m) => {
    if (exp==0) {
        return 1;
    } else if (!odd(exp)) {
        return sq(expmod(base, exp/2, m)) % m;
    } else {
        return (base * expmod(base, exp-1, m)) % m;
    }
};

let random = limit => Math.floor(limit * Math.random());

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
exports.random = random;

exports.test_it = function () {
    search_for_primes(1000, 1020);
    search_for_primes(10000, 10040);
    search_for_primes(100000, 100080);
};
