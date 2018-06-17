:load functions.sc

def larger_sq (x: Int, y: Int, z: Int): Int = {
  if (x < y && x < z) {
    sum_squares (List(y,z))
  } else if (y < x && y < z) {
    sum_squares (List(x,z))
  } else {
    sum_squares (List(x,y))
  }
}

val shouldEqual_13 = larger_sq(1,2,3) == 13
val shouldEqual_25 = larger_sq(4,2,3) == 25
val shouldEqual_41 = larger_sq(4,5,3) == 41
val shouldEqual_20 = larger_sq(4,2,1) == 20
