z = [];

z.push(10);

z.push(5 + 3 + 4);

z.push(9 - 1);

z.push(6 / 2);

z.push((2 * 4) + (4 - 6));

var a = 3;

var b = a + 1;

z.push(a + b + a * b);

z.push(a == b);

z.push((b > a) && (b < (a * b)) ? b : a);

z.push((function () {
    if (a == 4) return 6; else if (b == 4) return 6 + 7 + a; else return 25;
})());

z.push((b > a ? b : a) + 2);

z.push((function () {
        if (a > b) return a; else if (a < b) return b; else return -1;
    })() * (a + 1));

z.forEach(function (it) { print(it) });