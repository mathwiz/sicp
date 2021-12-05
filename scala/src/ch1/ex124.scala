// run with> scala exXXX.scala

import java.util.Random

def divides(a: Long, b: Long): Boolean = b % a == 0

def smallest_divisor(n: Int): Int = find_divisor(n, 2)

def find_divisor(n: Int, test: Int): Int = test match {
  case x if x * x > n => n
  case x if divides(test, n) => test
  case _ => find_divisor(n, test + 1)
}

//def prime(n: Int) = n == smallest_divisor(n)
def prime(n: Int) = fast_prime(n, 3)

def fast_prime(n: Int, times: Int): Boolean = times match {
  case 0 => true
  case _ if fermat_test(n) => fast_prime(n, times-1)
  case _ => false
}

def fermat_test(n: Int) : Boolean = {
  val try_it = (a: Int) => a == expmod(a, n, n)
  try_it(1 + random(n-1))
}

def expmod(base: Long, exp: Long, m: Long): Long = exp match {
  case 0 => 1
  case _ if divides(2, exp) => (square(expmod(base, exp/2, m)) % m).toLong
  case _ => ((base * expmod(base, exp-1, m)) % m)
}

def square(n: Long): BigInt = BigInt(n) * BigInt(n)

def random(limit: Int): Int = {
  new Random().nextInt(limit)
}

def report_prime(n: Int) = {
  if (prime(n)) {
    println(n + " ***")
  } else {
    println(n)
  }
}

def search_helper(n: Int, finish: Int): Int = {
  if (n <= finish) {
    report_prime(n)
    search_helper(n + 2, finish)
  } else {
    println("finished\n")
    0
  }
}

def search_for_primes(start: Int, finish: Int) =
  search_helper(if (divides(2, start)) start + 1 else start, finish)


// testing
search_for_primes(1000, 1020)
search_for_primes(10000, 10040)
search_for_primes(100000, 100080)

println("done")
