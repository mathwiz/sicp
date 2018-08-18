import unittest


def pascal(r, n):
    return 1 if n == 1 or n == r else pascal(r-1, n-1) + pascal(r-1, n)


class MyTestCase(unittest.TestCase):
    def test_something(self):
        self.assertEqual(pascal(5, 1), 1)
        self.assertEqual(pascal(5, 2), 4)
        self.assertEqual(pascal(5, 3), 6)
        self.assertEqual(pascal(5, 4), 4)
        self.assertEqual(pascal(5, 5), 1)
        self.assertEqual(pascal(6, 1), 1)
        self.assertEqual(pascal(6, 2), 5)
        self.assertEqual(pascal(6, 3), 10)
        self.assertEqual(pascal(6, 4), 10)
        self.assertEqual(pascal(6, 5), 5)
        self.assertEqual(pascal(6, 6), 1)


if __name__ == '__main__':
    unittest.main()
