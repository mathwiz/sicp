z = Array.new

z.push(10)

z.push(5+3+4)

z.push(9-1)

z.push(6/2)

z.push((2*4) + (4-6))

a = 3

b = a + 1

z.push(a+b+a*b)

z.push(a==b)

z.push(b>a && (b<(a*b)) ? b : a)

z.push(a == 4 ? 6 : b == 4 ? 6 + 7 + a : 25)

z.push((b > a ? b : a) + 2)

z.push((a > b ? a : a < b ? b : -1) * (a + 1))
 

z.each { |i| puts i }
