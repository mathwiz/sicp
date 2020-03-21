def gcd(a: Int, b: Int): Int = b match {
  case 0 => a
  case _ => gcd(b, a % b)
}

assert(gcd(206, 40) == 2)
assert(gcd(60, 45) == 15)
assert(gcd(24, 12) == 12)

println("done")
