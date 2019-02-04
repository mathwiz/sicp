def psi(n: Int) = Math.pow(((1 + Math.sqrt(5)) / 2), n)

def phi(n: Int) = Math.pow(((1 - Math.sqrt(5)) / 2), n)

def fib(n: Int): Long = n match {
  case 0 => 0
  case 1 => 1
  case _ => Math.round((psi(n) - phi(n)) / Math.sqrt(5))
}

assert(fib(0) == 0)
assert(fib(1) == 1)
assert(fib(2) == 1)
assert(fib(3) == 2)
assert(fib(4) == 3)
assert(fib(10) == 55)
assert(fib(15) == 610)
println("done")
