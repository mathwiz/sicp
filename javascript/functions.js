check_expect = function(jexp, expected) {
    print( (eval(jexp) == expected ? "passed" : "failed") + ": " + expected );
}

square = function(xs) {
    return xs.map( function(x) {return x * x} );
}

sum_squares = function(xs) {
    return xs.reduce( function(a, x) { return a + x * x; }, 0 );
}
