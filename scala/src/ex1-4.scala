def a_plus_abs_b_lambda (a: Int, b: Int): Int = {
  (if (b > 0) (() => a + b) else (() => a - b)) ()
}

def a_plus_abs_b_lambda2 (a: Int, b: Int): Int = {
  (if (b > 0) (x: Int) => a.+(x) else (x:Int) => a.-(x)) (b)
}

def a_plus_abs_b (a: Int, b: Int): Int = {
  a_plus_abs_b_lambda2 (a, b)
}

val shouldBeAdded = a_plus_abs_b(1, 2) == 3
val shouldBeSubtracted = a_plus_abs_b(1, -2) == 3
val shouldBeAddedWithNegA = a_plus_abs_b(-1, 2) == 1
val shouldBeSubtractedWithNegA = a_plus_abs_b(-1, -2) == 1
