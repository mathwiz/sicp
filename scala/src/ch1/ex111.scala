object ex111 {
  def rec(n: Int): Int = if (n < 3) n else rec(n - 1) + 2 * rec(n - 2) + 3 * rec(n - 3)

  def test(): String = {
    assert(stuff(1) == 1)
    "done"
  }
}
