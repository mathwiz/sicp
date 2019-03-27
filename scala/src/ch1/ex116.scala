def even(x: Int) = x % 2 == 0

def expt_inv(b: Int, p: Int, a: Int): Int = p match {
  case 0 => a
  case x if even(x) => expt_inv(b * b, p / 2, a)
  case _ => expt_inv(b, p - 1, a * b)
}

def expt(b: Int, p: Int) = expt_inv(b, p, 1)

assert(expt(2, 0) == 1)
assert(expt(2, 9) == 512)
assert(expt(3, 4) == 81)
assert(expt(3, 5) == 243)

println("done")
