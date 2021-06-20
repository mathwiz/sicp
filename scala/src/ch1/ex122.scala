// run with> scala exXXX.scala

def divides(a: Int, b: Int): Boolean = b % a == 0

def smallest_divisor(n: Int): Int = find_divisor(n, 2)

def find_divisor(n: Int, test: Int): Int = test match {
  case x if x * x > n => n
  case x if divides(test, n) => test
  case _ => find_divisor(n, test + 1)
}

def prime(n: Int) = n == smallest_divisor(n)

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
