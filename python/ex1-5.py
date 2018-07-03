def p():
    p()


def test(x, y):
    return 0 if x == 0 else y

# Try
# test(0, p()) => RecursionError: maximum recursion depth exceeded
