function A(x, y) {
    if (y == 0) return 0;
    else if (x == 0) return 2 * y;
    else if (y == 1) return 2;
    else return A(x - 1, A(x, y - 1));
}

function f(n) {
    return A(0, n);
}


function g(n) {
    return A(1, n);
}


function h(n) {
    return A(2, n);
}


function k(n) {
    return 5 * n * n;
}

