load('functions.js');

function a_plus_abs_b(a, b) {
    return ( b > 0 ? function() { return a + b } : function() { return a - b } ).call();
}

check_expect("a_plus_abs_b(1,2)", 3);
check_expect("a_plus_abs_b(1,-2)", 3);
check_expect("a_plus_abs_b(-1,2)", 1);
check_expect("a_plus_abs_b(-1,-2)", 1);