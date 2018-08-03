def inc(x: Int) = x + 1

def dec(x: Int) = x - 1

def plus_r(a: Int, b: Int): Int = a match {
  case 0 => b
  case _ => inc(plus_r(dec(a), b))
}

def plus_it(a: Int, b: Int): Int = a match {
  case 0 => b
  case _ => plus_it(dec(a), inc(b))
}

def test_it(): String = {
  assert(inc(1) == 2)
  assert(dec(1) == 0)
  assert(plus_r(3, 5) == 8)
  assert(plus_it(3, 5) == 8)
  "done"
}
