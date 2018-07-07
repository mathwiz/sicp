load('../functions.js');

larger_sq = function(x, y, z) {
    if (x <= y && x <= z) return sum_squares([y,z]);
    else if (y <= x && y <= z) return sum_squares([x,z]);
    else return sum_squares([x,y]);
}


check_expect("larger_sq(1,2,3)", 13);
check_expect("larger_sq(4,2,3)", 25);
check_expect("larger_sq(4,5,3)", 41);
check_expect("larger_sq(4,2,1)", 20);
