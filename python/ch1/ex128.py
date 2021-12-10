import unittest
import random

FAST_TIMES = 4


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


def fast_miller_rabin(n, times):
    if times == 0:
        return True
    if miller_rabin_test(n):
        return fast_miller_rabin(n, times - 1)
    return False


def miller_rabin_test(n):
    def try_it(a):
        return 1 == miller_rabin_expmod(a, n-1, n)
    return try_it(random.randint(1, n))


def miller_rabin_expmod(base, exp, m):
    def non_trivial_square_root(x, sq):
        if sq==1 and x!=1 and x!=(m-1):
            return 0
        else:
            return sq

    def squaremod_with_check(x):
        return non_trivial_square_root(x, square(x) % m)

    if exp == 0:
        return 1
    elif divides(2, exp):
        return squaremod_with_check(miller_rabin_expmod(base, exp/2, m))
    else:
        return (base * miller_rabin_expmod(base, exp-1, m)) % m


def test_number(n):
    result = (n, prime(n), fast_prime(n, FAST_TIMES), fast_miller_rabin(n, FAST_TIMES))
    print("%d \t Prime: %s \t Fast Prime: %s \t Miller-Rabin: %s" % result)


class MyTestCase(unittest.TestCase):
    def test2(self):
        test_number(10)
        test_number(81)
        test_number(6603)
        test_number(23)
        test_number(41)
        test_number(179)
        test_number(503)
        test_number(561)
        test_number(1105)
        test_number(1729)
        test_number(2465)
        test_number(2821)
        test_number(6601)


if __name__ == '__main__':
    unittest.main()
