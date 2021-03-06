import unittest

def even(x):
    return x % 2 == 0


def mult_inv(a, b):
    if b == 0:
        return 0
    elif even(b):
        return 2 * mult_inv(a, b / 2)
    else:
        return a + mult_inv(a, b - 1)


def mult(a, b):
    return mult_inv(a, b)


class MyTestCase(unittest.TestCase):
    def test1(self):
        self.assertEqual(even(1), False)
        self.assertEqual(even(2), True)

    def test2(self):
        self.assertEqual(mult(2, 0), 0)
        self.assertEqual(mult(2, 9), 18)
        self.assertEqual(mult(3, 4), 12)
        self.assertEqual(mult(3, 5), 15)


if __name__ == '__main__':
    unittest.main()
