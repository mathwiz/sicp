(defun cbrt-iter (guess x) 
  (if (good-enough? guess x) guess (cbrt-iter (improve guess x) x)))

(defun improve (guess x) 
  (/ (+ (* 2 guess) (/ x (square guess))) 3))

(defun average (x y) 
  (/ (+ x y) 2))

(defun good-enough?  (guess x)
  (< (abs (- (cube guess) x)) (/ guess 100000)))

(defun my-cbrt (x)
  (cbrt-iter 1.0 x))

(defun square (x)
  (* x x))

(defun cube (x)
  (* x x x))


(print (my-cbrt 27.0))
(print (cube (my-cbrt 27.0)))
(print (my-cbrt 0.027))
(print (cube (my-cbrt 0.027)))

