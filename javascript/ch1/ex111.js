// Load with load('ex111.js')

recursive = function(n) {
    return (n < 3) ? n : recursive(n-1) + 2 * recursive(n-2) + 3 * recursive(n-3);
};

single = function(a, b, c) {
    return a + 2 * b + 3 * c;
};

helper = function(a, b, c, x) {
    return (x == 3) ? single(a, b, c) : helper(single(a, b, c), a, b, x - 1);
};

iterative = function(n) {
    return (n < 3) ? n : helper(2, 1, 0, n);
};
