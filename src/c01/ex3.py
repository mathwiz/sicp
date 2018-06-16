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


print(larger_sq(1,2,3))
print(larger_sq(4,2,3))
print(larger_sq(4,5,3))
print(larger_sq(4,1,3))
