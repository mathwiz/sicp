import unittest


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
    return n == smallest_divisor(n)


def odd(n):
    return n % 2 == 1


def smallest_divisor(n):
    return find_divisor(n, 2)


def next(n):
    return 3 if n == 2 else n + 2


def find_divisor(n, test_divisor):
    if square(test_divisor) > n:
        return n
    elif divides(test_divisor, n):
        return test_divisor
    else:
        return find_divisor(n, next(test_divisor))


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
