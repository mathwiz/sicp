object sqrt {
  val factor = 1000000.0

  def square (x: Double) : Double = x * x

  def average (x: Double, y: Double) : Double = (x + y) / 2.0

  def improve (guess: Double, x: Double) : Double = average (guess, x / guess)

  def is_good_enough (guess: Double, x: Double) : Boolean = Math.abs (square(guess) - x) < (guess / factor)

  def sqrt_iter (guess: Double, x: Double) : Double = {
    if (is_good_enough(guess, x)) guess else sqrt_iter(improve(guess, x), x)
  }

  def apply (x: Double) : Double = sqrt_iter(1.0, x)
}

object ex1_7 extends App {
  val delta = 0.000001
  assert (Math.abs (sqrt.square(sqrt.apply(0.02)) - 0.02) < delta)
  assert (Math.abs (sqrt.square(sqrt.apply(0.0002)) - 0.0002) < delta)
  println("done testing ex1_7")
}