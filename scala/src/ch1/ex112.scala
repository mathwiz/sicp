object ex112 {
  def pascal(r: Int, n: Int): Int = n match {
    case 1 => 1
    case x if x == r => 1
    case _ => pascal(r - 1, n - 1) + pascal(r - 1, n)
  }

  def test(): String = {
    assert(pascal(5, 1) == 1)
    assert(pascal(5, 2) == 4)
    assert(pascal(5, 3) == 6)
    assert(pascal(5, 4) == 4)
    assert(pascal(5, 5) == 1)
    "done"
  }
}
