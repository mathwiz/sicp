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

let carmichael_num = (n) => {
    let car_test = a => a == expmod(a, n, n);
    let iter = x => {
        if (x==0)
            return true;
        else if (car_test(x))
            return iter(x-1);
        else
            return false;
    };
    return !is_prime(n) && iter(n-1);
};

let expmod = (base, exp, m) => {
    if (exp==0) {
        return 1;
    } else if (even(exp)) {
        return sq(expmod(base, exp/2, m)) % m;
    } else {
        return (base * expmod(base, exp-1, m)) % m;
    }
};

let random = limit => Math.floor(limit * Math.random());

let carmichael_result = (n) => {
    console.log("n = " + n + 
                " \tPrime: " + is_prime(n) + 
                " \tFast Prime: " + fast_prime(n, fast_times) + 
                " \tCarmichael: " + carmichael_num(n));
}

exports.carmichael_num = carmichael_num;

exports.test_it = function () {
    carmichael_result(10);
    carmichael_result(11);
    carmichael_result(561);
    carmichael_result(1105);
    carmichael_result(1729);
    carmichael_result(2465);
    carmichael_result(2821);
    carmichael_result(6601);
    //not a carmichael
    carmichael_result(6603);
};

exports.test_it();
