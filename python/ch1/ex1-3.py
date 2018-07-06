import nose
from functions import sum_squares


def larger_sq(x, y, z):
    lowest = min(x, y, z)
    if lowest == x:
        return sum_squares([y, z])
    elif lowest == y:
        return sum_squares([x, z])
    else:
        return sum_squares([x, y])


def test_sum_squares():
    assert sum_squares([1, 2, 3]) == 14


def test_larger_sq():
    assert larger_sq(2, 3, 4) == 25
    assert larger_sq(5, 3, 4) == 41
    assert larger_sq(1, 1, 1) == 2


if __name__ == '__main__':
    nose.runmodule()
