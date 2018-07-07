load('../functions.js');

sq = function (x) {
    return x * x;
};

average = function (x, y) {
    return (x + y) / 2.0;
};

improve = function (guess, x) {
    return average(guess, x / guess);
};

is_good_enough = function (guess, x) {
    return Math.abs(sq(guess) - x) < (guess / 100000);
};

sqrt_iter = function (guess, x) {
    return is_good_enough(guess, x) ? guess : sqrt_iter(improve(guess, x), x);
};

sqrt = function (x) {
    return sqrt_iter(1.0, x);
};

var delta = 0.0001;
check_expect_float(sqrt(0.02), Math.sqrt(0.02), delta);
check_expect_float(sqrt(0.0002), Math.sqrt(0.0002), delta);
