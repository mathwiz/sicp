(defun cube (x)
  (* x x x))

(defun p (x)
  (- (* 3 x) (* 4 (cube x))))

(defun sine (angle)
  (cond ((< (abs angle) 0.1) angle)
        (t (p (sine (/ angle 3.0))))))


(print (sine 1))
(print (sine 2))
(print (sine (/ PI 4)))
(print (sine (/ PI 6)))

(print 'done)
