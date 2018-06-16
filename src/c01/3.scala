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


println(larger_sq(1,2,3))
println(larger_sq(4,2,3))
println(larger_sq(4,5,3))
println(larger_sq(4,1,2))