import unittest


def biggest_denomination(n):
    if n == 1:
        return 1
    elif n == 2:
        return 5
    elif n == 3:
        return 10
    elif n == 4:
        return 25
    elif n == 5:
        return 50


def cc(amount, kinds_of_coins):
    if amount == 0:
        return 1
    elif amount < 0 or kinds_of_coins == 0:
        return 0
    else:
        return cc(amount, kinds_of_coins-1) + cc(amount-biggest_denomination(kinds_of_coins), kinds_of_coins)


def count_change(n):
    return cc(n, 5)


class MyTestCase(unittest.TestCase):
    def test1(self):
        self.assertEqual(count_change(0), 1)
        self.assertEqual(count_change(1), 1)
        self.assertEqual(count_change(2), 1)
        self.assertEqual(count_change(11), 4)
        self.assertEqual(count_change(100), 292)


if __name__ == '__main__':
    unittest.main()
