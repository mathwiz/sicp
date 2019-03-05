// Load with load('exXXX.js')

function p(x) {
    return 3 * x - 4 * cube(x);
}

function sine(angle) {
    if (Math.abs(angle) < 0.1) return angle;
    return p(sine(angle / 3.0));
}

function cube(x) {
    return x * x * x;
}