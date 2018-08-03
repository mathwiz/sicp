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
