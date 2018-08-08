object ex111 {
  def f_rec(n: Int): Int = if (n < 3) n else f_rec(n - 1) + 2 * f_rec(n - 2) + 3 * f_rec(n - 3)

  def f_it(n: Int): Int = if (n < 3) n else f_it_helper(2, 1, 0, n)

  def f_it_helper(a: Int, b: Int, c: Int, n: Int): Int =
    if (n == 3) a + 2 * b + 3 * c else f_it_helper(a + 2 * b + 3 * c, a, b, n - 1)

  def test(): String = {
    assert(f_rec(0) == 0)
    assert(f_rec(1) == 1)
    assert(f_rec(2) == 2)
    assert(f_rec(3) == 4)
    assert(f_rec(4) == 11)
    assert(f_rec(4) == f_it(4))
    assert(f_rec(8) == f_it(8))
    assert(f_rec(16) == f_it(16))
    "done"
  }
}
