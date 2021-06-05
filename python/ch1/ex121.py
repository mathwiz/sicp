import unittest


def smallest_divisor(n):
    return find_divisor(n, 2)


def find_divisor(n, test_divisor):
    if square(test_divisor) > n:
        return n
    elif divides(test_divisor, n):
        return test_divisor
    else:
        return find_divisor(n, test_divisor + 1)


def divides(a, b):
    return b % a == 0


def square(n):
    return n * n


class MyTestCase(unittest.TestCase):
    def test2(self):
        self.assertEqual(smallest_divisor(199), 199)
        self.assertEqual(smallest_divisor(1999), 1999)
        self.assertEqual(smallest_divisor(19999), 7)


if __name__ == '__main__':
    unittest.main()
