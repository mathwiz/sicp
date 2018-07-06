import unittest
import math


def sqrt(x):
    return sqrt_iter(1.0, x)


def sqrt_iter(guess, x):
    return guess if is_good_enough(guess, x) else sqrt_iter(improve(guess, x), x)


def improve(guess, x):
    return average(guess, x / guess)


def average(x, y):
    return (x + y) / 2.0


def is_good_enough(guess, x):
    return abs(square(guess) - x) < (guess / 100000)


def square(x):
    return x * x


# ------------------------------

class MyTest(unittest.TestCase):

    def test_sqrt(self):
        self.assertAlmostEqual(sqrt(0.02), math.sqrt(0.02), places=6)
        self.assertAlmostEqual(sqrt(0.0002), math.sqrt(0.0002), places=6)



if __name__ == '__main__':
    unittest.main()
