def even(x: Int) = x % 2 == 0

def mult_inv(b: Int, p: Int, a: Int): Int = p match {
  case 0 => a
  case x if even(x) => mult_inv(b * 2, p / 2, a)
  case _ => mult_inv(b, p - 1, a + b)
}

def mult(b: Int, p: Int) = mult_inv(b, p, 0)

assert(mult(2, 10) == 20)
assert(mult(2, 256) == 512)
assert(mult(3, 4) == 12)
assert(mult(3, 5) == 15)

println("done")
