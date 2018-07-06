(defun sqrt-iter (guess x) 
  (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))

(defun improve (guess x) 
  (average guess (/ x guess)))

(defun average (x y) 
  (/ (+ x y) 2))

(defun good-enough? (guess x)
  (< (abs (- (square guess) x)) 0.001))

(defun my-sqrt (x)
  (sqrt-iter 1.0 x))

(defun square (x)
  (* x x))

(defun new-if (predicate then-clause else-clause)
  (cond (predicate then-clause)
        (T else-clause)))

(defun bad-sqrt-iter (guess x)
  (new-if (good-enough? guess x) guess (bad-sqrt-iter (improve guess x) x)))

;; this will not complete
(defun my-bad-sqrt (x)
  (bad-sqrt-iter 1.0 x))
