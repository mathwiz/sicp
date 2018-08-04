object ex111 {
  def stuff(x: Int): Int = x % 2;

  def test(): String = {
    assert(stuff(1) == 1)
    "done"
  }
}
