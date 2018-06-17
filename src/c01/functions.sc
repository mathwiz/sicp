def sum_squares (xs: Seq[Int]): Int = {
  xs.foldLeft(0) {(a,x) => a + x*x }
}