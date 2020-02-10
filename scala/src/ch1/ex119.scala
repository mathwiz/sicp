def even(x: Int) = x % 2 == 0

def fib_iter(a: Int, b: Int, p: Int, q: Int, count: Int): Int = count match {
  case 0 => b
  case x if even(x) => fib_iter(a, b, p*p + q*q, q*q + 2*p*q, count / 2)
  case _ => fib_iter(b*q + a*q + a*p, b*p + a*q, p, q, count - 1)
}

def fib(n: Int) = fib_iter(1, 0, 0, 1, n)

assert(fib(0) == 0)
assert(fib(1) == 1)
assert(fib(2) == 1)
assert(fib(3) == 2)
assert(fib(6) == 8)
assert(fib(15) == 610)

println("done")
