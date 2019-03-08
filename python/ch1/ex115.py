import unittest
import math

def cube(x):
    return x * x * x


def p(x):
    return 3 * x - 4 * cube(x)


def sine(angle):
    if abs(angle) < 0.1:
        return angle
    else:
        return p(sine(angle / 3.0))



class MyTestCase(unittest.TestCase):
    def test1(self):
        self.assertEqual(sine(0), 0)

    def test2(self):
        print("Just printing.")
        print(sine(2))
        print(sine(math.pi / 6))


if __name__ == '__main__':
    unittest.main()
