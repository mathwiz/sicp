import unittest
import math

def fib(n):
    psi = (1 + math.sqrt(5))/2
    phi = (1 - math.sqrt(5))/2
    return n if n==0 or n==1 else round((psi**n - phi**n)/math.sqrt(5))


class MyTestCase(unittest.TestCase):
    def test_fib(self):
        self.assertEqual(fib(0), 0)
        self.assertEqual(fib(1), 1)
        self.assertEqual(fib(2), 1)
        self.assertEqual(fib(3), 2)
        self.assertEqual(fib(4), 3)
        self.assertEqual(fib(5), 5)
        self.assertEqual(fib(15), 610)


if __name__ == '__main__':
    unittest.main()
