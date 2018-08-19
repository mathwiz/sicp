pascal = function(r, n) {
    return (n == 1 || n == r) ? 1 : pascal(r-1, n-1) + pascal(r-1, n);
}
