import unittest


def A(x, y):
    if y == 0:
        return 0
    elif x == 0:
        return 2 * y
    elif y == 1:
        return 2
    else:
        return A(x - 1, A(x, y - 1))


def f(n):
    return A(0, n)


def g(n):
    return A(1, n)


def h(n):
    return A(2, n)


def k(n):
    return 5 * n * n


class MyTest(unittest.TestCase):

    def test_root(self):
        self.assertEqual(A(1, 10), 1024)
        self.assertEqual(A(2, 4), 65536)
        self.assertEqual(A(3, 3), 65536)
        self.assertEqual(f(4), 8)
        self.assertEqual(f(78), 156)
        self.assertEqual(g(4), 16)
        self.assertEqual(h(4), 65536)


if __name__ == '__main__':
    unittest.main()
