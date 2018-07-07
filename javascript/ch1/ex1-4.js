load('../functions.js');

function a_plus_abs_b_anon(a, b) {
    return ( b > 0 ? function() { return a + b } : function() { return a - b } ).call();
}


function a_plus_abs_b_named(a, b) {
    var add_fn = function(x, y) { return x + y };
    var sub_fn = function(x, y) { return x - y };
    return ( b > 0 ? add_fn : sub_fn ).call(this, a, b);
}

function a_plus_abs_b(a, b) {
    return a_plus_abs_b_named(a, b);
}

check_expect("a_plus_abs_b(1,2)", 3);
check_expect("a_plus_abs_b(1,-2)", 3);
check_expect("a_plus_abs_b(-1,2)", 1);
check_expect("a_plus_abs_b(-1,-2)", 1);