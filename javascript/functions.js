check_expect = function(jexp, expected) {
    print((eval(jexp) == expected ? "passed" : "failed") + ": " + expected);
};

check_expect_float = function(jexp, expected, delta) {
    print((delta_compare(eval(jexp), expected, delta) ? "passed" : "failed") + ": " + expected);
};

delta_compare = function(actual, expected, delta) {
    return Math.abs(actual - expected) < delta;
};

square = function(xs) {
    return xs.map( function(x) {return x * x} );
};

sum_squares = function(xs) {
    return xs.reduce( function(a, x) { return a + x * x; }, 0 );
};
