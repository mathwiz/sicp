from functools import reduce


def sum_squares(xs):
    return reduce(lambda a, x: a + x * x, [0] + xs)


