import unittest
import math


def cbrt(x):
    return iter(1.0, x)


def iter(guess, x):
    return guess if is_good_enough(guess, x) else iter(improve(guess, x), x)


def improve(guess, x):
    return (x / square(guess) + 2 * guess) / 3.0


def square(x):
    return x * x


def is_good_enough(guess, x):
    return abs(cube(guess) - x) < (guess / 100000.0)


def cube(x):
    return x * x * x


# ------------------------------

class MyTest(unittest.TestCase):

    def test_root(self):
        self.assertAlmostEqual(cube(cbrt(27.0)), 27.0, places=4)
        self.assertAlmostEqual(cube(cbrt(7.0)), 7.0, places=4)
        self.assertAlmostEqual(cube(cbrt(0.027)), 0.027, places=4)



if __name__ == '__main__':
    unittest.main()
