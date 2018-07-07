object cbrt {
  val factor = 1000000.0

  def square (x: Double) : Double = x * x

  def cube (x: Double) : Double = x * x * x

  def improve (guess: Double, x: Double) : Double = (2 * guess + x / square(guess)) / 3

  def is_good_enough (guess: Double, x: Double) : Boolean = Math.abs (cube(guess) - x) < (guess / factor)

  def cbrt_iter (guess: Double, x: Double) : Double = {
    if (is_good_enough(guess, x)) guess else cbrt_iter(improve(guess, x), x)
  }

  def apply (x: Double) : Double = cbrt_iter(1.0, x)
}

object ex1_7 extends App {
  val delta = 0.0001
  assert (Math.abs (cbrt.cube(cbrt.apply(27)) - 27) < delta)
  assert (Math.abs (cbrt.cube(cbrt.apply(0.00027)) - 0.00027) < delta)
  println("done testing ex1_8")
}