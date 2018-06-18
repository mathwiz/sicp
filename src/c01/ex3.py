from functions import sum_squares

def larger_sq(x, y, z):
    lowest = min(x,y,z)
    if lowest == x:
        return sum_squares([y,z])
    elif lowest == y:
        return sum_squares([x,z])
    else:
        return sum_squares([x,y])


print(sum_squares([1,2,3]))
print(larger_sq(2,3,4))
print(larger_sq(5,3,4))
print(larger_sq(1,1,1))