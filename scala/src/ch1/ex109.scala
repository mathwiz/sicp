def inc(x: Int) = x + 1

def dec(x: Int) = x - 1

def plus_r(a: Int, b: Int): Int = if (a == 0) b else inc(plus_r(dec(a), b))

def plus_it(a: Int, b: Int): Int = if (a == 0)  b else plus_it(dec(a), inc(b))

def test_it(): String = {
  assert(inc(1) == 2)
  assert(dec(1) == 0)
  assert(plus_r(3, 5) == 8)
  assert(plus_it(3, 5) == 8)
  "done"
}
