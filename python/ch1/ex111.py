import unittest


def recursive(n):
    return n if n < 3 else recursive(n-1) + 2 * recursive(n-2) + 3 * recursive(n-3)


def single(a, b, c):
    return a + 2 * b + 3 * c


def helper(a, b, c, n):
    return single(a, b, c) if n == 3 else helper(single(a, b, c), a, b, n - 1)


def iterative(n):
    return n if n < 3 else helper(2, 1, 0, n)


class MyTest(unittest.TestCase):

    def test_rec(self):
        self.assertEqual(recursive(1), 1)
        self.assertEqual(recursive(4), 11)
        self.assertEqual(recursive(5), 25)
        self.assertEqual(recursive(8), 335)

    def test_it(self):
        self.assertEqual(iterative(1), 1)
        self.assertEqual(iterative(4), 11)
        self.assertEqual(iterative(5), 25)
        self.assertEqual(iterative(8), 335)


if __name__ == '__main__':
    unittest.main()
