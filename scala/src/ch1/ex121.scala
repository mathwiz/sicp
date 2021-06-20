// run with> scala exXXX.scala

def divides(a: Int, b: Int): Boolean = b % a == 0

def smallest_divisor(n: Int): Int = find_divisor(n, 2)

def find_divisor(n: Int, test: Int): Int = test match {
  case x if x * x > n => n
  case x if divides(test, n) => test
  case _ => find_divisor(n, test + 1)
}

assert(smallest_divisor(199) == 199)
assert(smallest_divisor(1999) == 1999)
assert(smallest_divisor(19999) == 7)

println("done")
