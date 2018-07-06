def square (x: Double) : Double = x * x

def average (x: Double, y: Double) : Double = (x + y) / 2.0

def improve (guess: Double, x: Double) : Double = average (guess, x / guess)

def is_good_enough (guess: Double, x: Double) : Boolean = Math.abs (square(guess) - x) < 0.001

def sqrt_iter (guess: Double, x: Double) : Double = {
  if (is_good_enough(guess, x)) guess else sqrt_iter(improve(guess, x), x)
}

def sqrt (x: Double) : Double = sqrt_iter(1.0, x)

def new_if (predicate: Boolean, then_clause: Double, else_clause: Double) : Double = {
  if (predicate) then_clause else else_clause
}

def bad_sqrt_iter (guess: Double, x: Double) : Double = {
   new_if (is_good_enough(guess, x), guess, bad_sqrt_iter(improve(guess, x), x))
}

//this will throw java.lang.StackOverflowError
def bad_sqrt (x: Double) : Double = bad_sqrt_iter(1.0, x)
