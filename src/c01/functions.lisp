(defun sum-squares (xs)
  (reduce (lambda (x y) (+ x (* y y))) xs :initial-value 0))
