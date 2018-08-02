def inc(x: Int) = x + 1

def dec(x: Int) = x - 1

def test_it(): String = {
  assert(inc(1) == 2)
  assert(dec(1) == 0)
  "done"
}
