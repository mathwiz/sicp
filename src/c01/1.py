# Hack to print each expression in a separate line
z = []

z.append(10)

z.append(5+3+4)

z.append(9-1)

z.append(6//2)

z.append((2*4) + (4-6))

a = 3

b = a + 1

z.append(a+b+a*b)

z.append(a == b)

z.append(b if b>a and b<a*b else a)

z.append(6 if a==4 else 6+7+a if b==4 else 25)

z.append(2 + (b if b>a else a))

z.append((a if a>b else b if a<b else -1) * (a+1))

print(*z, sep='\n')
