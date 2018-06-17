def larger_sq (x: Int, y: Int, z: Int): Int = {
  if (x < y && x < z) {
    sum_sq(y,z)
  } else if (y < x && y < z) {
    sum_sq(x,z)
  } else {
    sum_sq(x,y)
  }
}

def sum_sq (x: Int, y: Int): Int = {
  x * x + y * y
}

val shouldEqual_13 = larger_sq(1,2,3) == 13
val shouldEqual_25 = larger_sq(4,2,3) == 25
val shouldEqual_41 = larger_sq(4,5,3) == 41
val shouldEqual_20 = larger_sq(4,2,1) == 20
