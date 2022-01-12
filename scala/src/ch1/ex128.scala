// run with> scala exXXX.scala

import java.util.Random

def square(n: BigInt): BigInt = n * n

def random(limit: Int): Int = new Random().nextInt(limit)

def divides(a: BigInt, b: BigInt): Boolean = b % a == 0

def smallest_divisor(n: Int): Int = find_divisor(n, 2)

def find_divisor(n: Int, test: Int): Int = test match {
  case x if x * x > n => n
  case x if divides(test, n) => test
  case _ => find_divisor(n, test + 1)
}

def prime(n: Int) = n == smallest_divisor(n)

def fast_prime(n: Int, times: Int): Boolean = times match {
  case 0 => true
  case _ if fermat_test(n) => fast_prime(n, times-1)
  case _ => false
}

def fermat_test(n: Int) : Boolean = {
  val try_it = (a: Int) => a == expmod(a, n, n)
  try_it(1 + random(n-1))
}

def expmod(base: BigInt, exp: Int, m: BigInt): BigInt = exp match {
  case 0 => BigInt(1)
  case _ if divides(2, exp) => (square(expmod(base, exp/2, m)) % m)
  case _ => ((base * expmod(base, exp-1, m)) % m)
}

def miller_rabin_expmod(base: BigInt, exp: Int, m: BigInt): BigInt = {
  def nontrivial_sqrt(x: BigInt, sq: BigInt) : BigInt = {
    if (sq == 1 && x != 1 && x != m-1) 0 else sq
  }
  def squaremod_with_check(x: BigInt) : BigInt = {
    nontrivial_sqrt(x, square(x) % m)
  }
  exp match {
    case 0 => BigInt(1)
    case _ if divides(2, exp) => (squaremod_with_check(miller_rabin_expmod(base, exp/2, m)) % m)
    case _ => ((base * miller_rabin_expmod(base, exp-1, m)) % m)
  }
}

def miller_rabin_test(n: Int) : Boolean = {
  val try_it = (a: Int) => 1 == miller_rabin_expmod(a, n-1, n)
  try_it(1 + random(n-1))
}

def fast_miller_rabin(n: Int, times: Int) : Boolean = {
  times == 0 || (miller_rabin_test(n) && fast_miller_rabin(n, times-1))
}

def test_number(n: Int) = {
  printf("%d  \tPrime: %s \tFast Prime: %s \tMiller-Rabin: %s \n", n, prime(n), fast_prime(n, 20), fast_miller_rabin(n, 20))
}

// testing
test_number(10)
test_number(81)
test_number(23)
test_number(41)
test_number(561)
test_number(1105)
test_number(1729)
test_number(2465)
test_number(2821)
test_number(6601)

println("done")
