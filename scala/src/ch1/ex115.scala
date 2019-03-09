def cube(x: Double) = x * x * x

def p(x: Double) = 3 * x - 4 * cube(x)

def sine(angle: Double): Double = angle match {
  case x if Math.abs(x) < 0.1 => x
  case _ => p(sine(angle / 3.0))
}

assert(sine(0) == 0)
assert(sine(1) > 0.84)
assert(sine(2) < 0.91)
assert(sine(3) < 1.42)

println("done")
