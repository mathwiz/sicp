import nose
import operator


def a_plus_abs_b_old(a, b):
    return ((lambda: a + b) if b > 0 else (lambda: a - b))()


def a_plus_abs_b(a, b):
    return (operator.add if b > 0 else operator.sub)(a, b)


def test_1():
    assert a_plus_abs_b(1, 2) == 3
    assert a_plus_abs_b(1, -2) == 3
    assert a_plus_abs_b(-1, 2) == 1
    assert a_plus_abs_b(-1, -2) == 1


if __name__ == '__main__':
    nose.runmodule()
