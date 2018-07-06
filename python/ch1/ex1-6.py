import unittest


def sqrt(x):
    return sqrt_iter(1.0, x)


def sqrt_iter(guess, x):
    return guess if is_good_enough(guess, x) else sqrt_iter(improve(guess, x), x)


def improve(guess, x):
    return average(guess, x / guess)


def average(x, y):
    return (x + y) / 2.0


def is_good_enough(guess, x):
    return abs(square(guess) - x) < 0.001


def square(x):
    return x * x


def bad_sqrt(x):
    return bad_sqrt_iter(1.0, x)


def bad_sqrt_iter(guess, x):
    return new_if(is_good_enough(guess, x), guess, bad_sqrt_iter(improve(guess, x), x))


def new_if(predicate, then_clause, else_clause):
    return then_clause if predicate else else_clause


# -------------------------------
class MyTest(unittest.TestCase):

    def test_sqrt(self):
        self.assertAlmostEqual(sqrt(9), 3.0, places=3)
        self.assertAlmostEqual(sqrt(2), 1.414, places=3)

    @unittest.skipIf(True, "Will produce: RecursionError: maximum recursion depth exceeded")
    def test_bad_sqrt(self):
        self.assertAlmostEqual(bad_sqrt(9), 3.0, places=3)
        self.assertAlmostEqual(bad_sqrt(2), 1.414, places=3)


if __name__ == '__main__':
    unittest.main()
