def A(x: Int, y: Int): Int = y match {
  case 0 => 0
  case 1 => 2
  case _ => x match {
    case 0 => 2 * y
    case _ => A(x - 1, A(x, y - 1))
  }
}

def f(n: Int) = A(0, n)
def g(n: Int) = A(1, n)
def h(n: Int) = A(2, n)
def k(n: Int) = 5 * n * n

def test_it() = {
  assert(A(0, 0) == 0)
  assert(A(1, 0) == 0)
  assert(A(0, 1) == 2)
  assert(A(1, 1) == 2)
  assert(A(0, 2) == 4)
  assert(A(1, 10) == 1024)
  assert(A(2, 4) == 65536)
  assert(A(3, 3) == 65536)
  assert(f(4) == 8)
  assert(f(78) == 156)
  assert(g(4) == 16)
  assert(h(4) == 65536)
  "done"
}