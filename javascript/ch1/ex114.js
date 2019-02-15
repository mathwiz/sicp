// Load with load('exXXX.js')

function count_change(amount) {
    return cc(amount, 5);
}

function cc(amount, kinds_of_coins) {
    if (amount == 0) return 1;
    if (amount < 0 || kinds_of_coins == 0) return 0;
    return cc(amount, kinds_of_coins - 1) +
        cc(amount - biggest_denomination(kinds_of_coins), kinds_of_coins);
}

function biggest_denomination(kinds_of_coins) {
    switch (kinds_of_coins) {
        case 1:
            return 1;
        case 2:
            return 5;
        case 3:
            return 10;
        case 4:
            return 25;
        case 5:
            return 50;
    }
    return Number.MIN_VALUE;
}