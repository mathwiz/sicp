def inc(x):
    return x + 1


def dec(x):
    return x - 1


def plus_r(a, b):
    return b if (a == 0) else inc(plus_r(dec(a), b))


def plus_it(a, b):
    return b if (a == 0) else plus_it(dec(a), inc(b))


