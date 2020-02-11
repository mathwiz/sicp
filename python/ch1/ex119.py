import unittest

def even(x):
    return x % 2 == 0

def sq(x):
    return x * x

def fib_iter(a, b, p, q, count):
    if count == 0:
        return b
    elif even(count):
        return fib_iter(a, b, sq(p) + sq(q), sq(q) + 2*p*q, count / 2)
    else:
        return fib_iter(b*q + a*q + a*p, b*p + a*q, p, q, count - 1)


def fib(n):
    return fib_iter(1, 0, 0, 1, n)


class MyTestCase(unittest.TestCase):
    def test2(self):
        self.assertEqual(fib(0), 0)
        self.assertEqual(fib(1), 1)
        self.assertEqual(fib(2), 1)
        self.assertEqual(fib(3), 2)
        self.assertEqual(fib(4), 3)
        self.assertEqual(fib(5), 5)
        self.assertEqual(fib(6), 8)
        self.assertEqual(fib(7), 13)
        self.assertEqual(fib(15), 610)


if __name__ == '__main__':
    unittest.main()
