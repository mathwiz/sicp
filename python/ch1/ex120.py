import unittest

def gcd(a, b):
    if b == 0:
        print("returning {:d}".format(a))
        return a
    else:
        print("remainder {:d} {:d}".format(a, b))
        return gcd(b, a % b)


class MyTestCase(unittest.TestCase):
    def test2(self):
        self.assertEqual(gcd(206, 40), 2)
        self.assertEqual(gcd(24, 12), 12)
        self.assertEqual(gcd(60, 45), 15)


if __name__ == '__main__':
    unittest.main()
