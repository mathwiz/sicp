import unittest
import random

FAST_TIMES = 2


def search_for_primes(start, end):
    print("")
    return search_helper(start if odd(start) else start + 1, end)


def search_helper(n, end):
    if n <= end:
        prime_test(n)
        return search_helper(n + 2, end)
    else:
        print("finished")


def prime_test(n):
    if prime(n):
        print("*** %d" % n)
    else:
        print("%d" % n)


def prime(n):
    return fast_prime(n, FAST_TIMES)


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


# Inefficient use of 2 multiplications instead of square
def expmod(base, exp, m):
    if exp == 0:
        return 1
    elif not odd(exp):
        return (expmod(base, exp/2, m) * expmod(base, exp/2, m)) % m
    else:
        return (base * expmod(base, exp-1, m)) % m


def odd(n):
    return n % 2 == 1


def divides(a, b):
    return b % a == 0


def square(n):
    return n * n


class MyTestCase(unittest.TestCase):
    def test2(self):
        search_for_primes(1000, 1020)
        search_for_primes(10000, 10040)
        search_for_primes(100000, 100080)


if __name__ == '__main__':
    unittest.main()
