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
    return Math.abs(sq(guess) - x) < 0.001;
};

sqrt_iter = function (guess, x) {
    return is_good_enough(guess, x) ? guess : sqrt_iter(improve(guess, x), x);
};

sqrt = function (x) {
    return sqrt_iter(1.0, x);
};

bad_sqrt_iter = function (guess, x) {
    return new_if(is_good_enough(guess, x), guess, bad_sqrt_iter(improve(guess, x), x));
};

bad_sqrt = function (x) {
    return bad_sqrt_iter(1.0, x);
};

new_if = function (predicate, then_clause, else_clause) {
    return predicate ? then_clause : else_clause;
};

var delta = 0.0001;
check_expect_float(sqrt(2), Math.sqrt(2), delta);
check_expect_float(sqrt(9), Math.sqrt(9), delta);
// will throw StackOverflow
//check_expect_float(bad_sqrt(2), Math.sqrt(2), 0.00001);
