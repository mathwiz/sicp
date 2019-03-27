import unittest
import math


def even(x):
    return x % 2 == 0


def expt_inv(b, p, a):
    if p == 0:
        return a
    elif even(p):
        return expt_inv(b * b, p / 2, a)
    else:
        return expt_inv(b, p - 1, a * b)


def expt(b, p):
    return expt_inv(b, p, 1)


class MyTestCase(unittest.TestCase):
    def test1(self):
        self.assertEqual(even(1), False)
        self.assertEqual(even(2), True)

    def test2(self):
        self.assertEqual(expt(2, 0), 1)
        self.assertEqual(expt(2, 9), 512)
        self.assertEqual(expt(3, 4), 81)
        self.assertEqual(expt(3, 5), 243)


if __name__ == '__main__':
    unittest.main()
