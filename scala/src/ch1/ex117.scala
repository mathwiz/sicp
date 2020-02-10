def even(x: Int) = x % 2 == 0

def mult_inv(a: Int, b: Int): Int = b match {
  case 0 => 0
  case x if even(x) => 2 * mult_inv(a, b  / 2)
  case _ => a + mult_inv(a, b - 1)
}

def mult(a: Int, b: Int) = mult_inv(a, b)

assert(mult(2, 10) == 20)
assert(mult(2, 256) == 512)
assert(mult(3, 4) == 12)
assert(mult(3, 5) == 15)

println("done")
