load('../functions.js');

sq = function (x) {
    return x * x;
};

cube = function (x) {
    return x * x * x;
};

improve = function (guess, x) {
    return (x / sq(guess) + 2 * guess) / 3.0;
};

is_good_enough = function (guess, x) {
    return Math.abs(cube(guess) - x) < (guess / 100000);
};

cbrt_iter = function (guess, x) {
    return is_good_enough(guess, x) ? guess : cbrt_iter(improve(guess, x), x);
};

cbrt = function (x) {
    return cbrt_iter(1.0, x);
};

var delta = 0.0001;
check_expect_float(cube(cbrt(27)), 27, delta);
check_expect_float(cube(cbrt(0.27)), 0.27, delta);
