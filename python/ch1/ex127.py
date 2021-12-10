import unittest
import random

FAST_TIMES = 32


def divides(a, b):
    return b % a == 0


def square(n):
    return n * n


def smallest_divisor(n):
    return find_divisor(n, 2)


def find_divisor(n, test):
    if square(test) > n:
        return n
    elif divides(test, n):
        return test
    else:
        return find_divisor(n, test+1)


def prime(n):
    return n == smallest_divisor(n)


def fast_prime(n, times):
    if times == 0:
        return True
    if fermat_test(n):
        return fast_prime(n, times - 1)
    return False


def fermat_test(n):
    def try_it(a):
        return a == expmod(a, n, n)
    return try_it(random.randint(1, n))


def expmod(base, exp, m):
    if exp == 0:
        return 1
    elif divides(2, exp):
        return square(expmod(base, exp/2, m)) % m
    else:
        return (base * expmod(base, exp-1, m)) % m


# recusion depth problem with large numbers
def carmichael_num(n):
    def try_it(a):
        return a == expmod(a, n, n)
    def iter(x):
        for i in range(x, 0, -1):
            if not try_it(i):
                return False
        return True
    return iter(n-1) if not prime(n) else False


def test_number(n):
    result = (n, prime(n), fast_prime(n, FAST_TIMES), carmichael_num(n))
    print("%d \t Prime: %s \t Fast Prime: %s \t Carmichael: %s" % result)


class MyTestCase(unittest.TestCase):
    def test2(self):
        test_number(10)
        test_number(81)
        test_number(23)
        test_number(41)
        test_number(561)
        test_number(1105)
        test_number(1729)
        test_number(2465)
        test_number(2821)
        test_number(6601)


if __name__ == '__main__':
    unittest.main()
