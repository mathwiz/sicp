def larger_sq(x, y, z):
    lowest = min(x,y,z)
    if lowest == x:
        return sum_sq(y,z)
    elif lowest == y:
        return sum_sq(x,z)
    else:
        return sum_sq(x,y)


def sum_sq(x, y):
    return x*x + y*y

