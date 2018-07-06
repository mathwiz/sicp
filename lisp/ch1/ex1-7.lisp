(defun sqrt-iter (guess x) 
  (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))

(defun improve (guess x) 
  (average guess (/ x guess)))

(defun average (x y) 
  (/ (+ x y) 2))

(defun good-enough?  (guess x)
  (< (abs (- (square guess) x)) (/ guess 100000)))

(defun my-sqrt (x)
  (sqrt-iter 1.0 x))

(defun square (x)
  (* x x))

