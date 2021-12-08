// Load with: const ExXXX = require('./ExXXX')
// Run with: ExXXX.xxx()
// Command line: node ExXXX.js

let fast_times = 128;

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

let even = n => divides(2, n);

let is_prime = n => n == smallest_divisor(n);

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

let fast_miller_rabin = (n, times) => {
    if (times==0) {
        return true;
    } else if (miller_rabin_test(n)) {
        return fast_miller_rabin(n, times-1);
    } else {
        return false;
    }
};

let miller_rabin_test = n => {
    let try_it = a => 1 == miller_rabin_expmod(a, n-1, n);
    return try_it(1 + random(n-1));
}

let expmod = (base, exp, m) => {
    if (exp==0) {
        return 1;
    } else if (even(exp)) {
        return sq(expmod(base, exp/2, m)) % m;
    } else {
        return (base * expmod(base, exp-1, m)) % m;
    }
};

let miller_rabin_expmod = (base, exp, m) => {
    let non_trivial_square_root = (x, square) => {
        return (square == 1) && (x != 1) && (x != (m-1)) ? 0 : square;
    };
    let squaremod_with_check = x => non_trivial_square_root(sq(x) % m);
    if (exp==0) {
        return 1;
    } else if (even(exp)) {
        return squaremod_with_check(miller_rabin_expmod(base, exp/2, m));
    } else {
        return (base * miller_rabin_expmod(base, exp-1, m)) % m;
    }
};

let random = limit => Math.floor(limit * Math.random());

let test_case = (n) => {
    console.log("n = " + n + 
                " \tPrime: " + is_prime(n) + 
                " \tFast Prime: " + fast_prime(n, fast_times) + 
                " \tMiller Rabin: " + fast_miller_rabin(n, fast_times));
}

exports.test_case = test_case;

exports.test_it = function () {
    //prime
    test_case(11);
    test_case(97);
    test_case(127);
    //not prime
    test_case(10);
    test_case(77);
    test_case(6603);
    //carmichael numbers
    test_case(561);
    test_case(1105);
    test_case(1729);
    test_case(2465);
    test_case(2821);
    test_case(6601);
};

exports.test_it();
