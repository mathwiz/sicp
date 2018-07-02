def a_plus_abs_b (a: Int, b: Int): Int = {
  (if (b > 0) (() => a + b) else (() => a - b)) ()
}


val shouldBeAdded = a_plus_abs_b(1, 2) == 3
val shouldBeSubtracted = a_plus_abs_b(1, -2) == 3
val shouldBeAddedWithNegA = a_plus_abs_b(-1, 2) == 1
val shouldBeSubtractedWithNegA = a_plus_abs_b(-1, -2) == 1
